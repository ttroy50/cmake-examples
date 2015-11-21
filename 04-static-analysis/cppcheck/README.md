# CppCheck Static Analysis

This example is for calling the cppcheck tool to do static analysis. 

It shows how to add cppcheck with a target for each sub-projects and also how to generate an overall "make analysis" target to do static analysis on all sub-projects.

## Requirements

To run this example you must have the CppCheck utility installed. On Ubuntu you can install it as

```
$ sudo apt-get install cppcheck
```

## Concepts

### Adding Custom Package Modules

#### Adding a custom module

The cmake/modules/FindCppCheck.cmake file contains the code to find and add variables for a custom package module. Custom modules can be used to find programs, libraries and header files to include in your program.

```
find_program(CPPCHECK_BIN NAMES cppcheck)
```
Search the path for the program "cppcheck" and store the result in the CPPCHECK_BIN variable


```
set (CPPCHECK_THREADS "-j 4" CACHE STRING "The -j argument to have cppcheck use multiple threads / cores")

set (CPPCHECK_ARG "${CPPCHECK_THREADS}" CACHE STRING "The arguments to pass to cppcheck. If set will overwrite CPPCHECK_THREADS")
```
Set some custom arguments that can be later passed to cppcheck. 


```
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
    CPPCHECK 
    DEFAULT_MSG 
    CPPCHECK_BIN
    CPPCHECK_THREADS
    CPPCHECK_ARG)

mark_as_advanced(
    CPPCHECK_BIN  
    CPPCHECK_THREADS
    CPPCHECK_ARG)
```

Export the variables so that they can be seen from ccmake / cmake-gui and set in the cache. By default these will not be visible unless the view advanced flag is set.


#### Setting path to custom modules

```
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules
                      ${CMAKE_MODULE_PATH})
```

The ${CMAKE_MODULE_PATH} points towards a folder which contains custom cmake modules.

To then add the package module you can call 

```
find_package(CppCheck)
```

### Parent Scope Variables

The scope of variables when they are declared / changed is typically in the function of file the are called. To make a change to a variable which is the caller of your scope, you should call it as follows:

```
set(ALL_ANALYSIS_TARGETS "${ALL_ANALYSIS_TARGETS}" PARENT_SCOPE)
```

### add_analysis macro

The add_analysis macro in cmake/analysis.cmake is the core idea for this example. If cppcheck is available then a list of arguments are compiled and added to a custom command that calls cppcheck on the sources. These are then added to a custom target.

```
get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
    LIST(APPEND cppcheck_includes "-I${dir}")
endforeach()
```
Find the include files from and calls to include_directories() in the same project.


```
LIST(APPEND ALL_ANALYSIS_TARGETS "${_target}_analysis")
set(ALL_ANALYSIS_TARGETS "${ALL_ANALYSIS_TARGETS}" PARENT_SCOPE)
```
Export the target name into a variable that can later be used to add a global "make analysis" target.


```
if (${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VESION} GREATER 2.7)
    separate_arguments(tmp_args UNIX_COMMAND ${CPPCHECK_ARG})
else ()
    # cmake 2.6 has different arguments 
    string(REPLACE " " ";" tmp_args ${CPPCHECK_ARG})         
endif ()
```
Change the CPPCHECK_ARG so that the can be added to command correctly in the custom command.


```
add_custom_target(${_target}_analysis)
set_target_properties(${_target}_analysis PROPERTIES EXCLUDE_FROM_ALL TRUE)
```
Add a custom target with a name you have passed in followed by _analysis. Do not include this in the all target.

```
add_custom_command(TARGET ${_target}_analysis PRE_BUILD
            WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
            COMMAND ${CPPCHECK_BIN} ${tmp_args} ${cppcheck_includes} ${${_sources}}
            DEPENDS ${${_sources}}
            COMMENT "Running cppcheck: ${_target}"
            VERBATIM)
```
Add a custom command which is called from the custom target added above. This will call cppcheck with any includes, arguments and sources that you have provided. The sources that are analysed come from a _sources variable. This should be the name of the variable which holds your list of source files.


To call the add_analysis marco add the following to your projects CMakeLists.txt file:

```
include(${CMAKE_SOURCE_DIR}/cmake/analysis.cmake)
add_analysis(${PROJECT_NAME} SOURCES)
```

### Creating a target to call other targets

In the root CMakeLists.txt a custom target is created, which will call all other analysis targets. This allows you to call "make analysis" and scan all sub projects.

To achieve this 2 things should be added to the root CMakeLists.txt

First add an empty variable ALL_ANALYSIS_TARGETS before calling your add_subdirectories() function.

```
set (ALL_ANALYSIS_TARGETS)
```

Second add the following after your add_subdirectories() call.

```
if( CPPCHECK_FOUND )
    add_custom_target(analysis)
    ADD_DEPENDENCIES(analysis ${ALL_ANALYSIS_TARGETS})
    set_target_properties(analysis PROPERTIES EXCLUDE_FROM_ALL TRUE)
    message("analysis analysis targets are ${ALL_ANALYSIS_TARGETS}")
endif()
```
This adds the "make analysis" target which calls all the sub-targets.


## Extra Notes

If you have a multiple folders levels, where one folder just points to sub folders, such as below:

```
├── root
│   ├── CMakeLists.txt
│   ├── src
│   │   ├── CMakeLists.txt
│   │   ├── project
│   │   │   ├── CMakeLists.txt
│   │   │   ├── main.cpp
│   │   ├── project
│   │   │   ├── CMakeLists.txt
│   │   │   ├── main.cpp

```

You must add the following to the src/CMakeLists.txt file to correctly generate the "make analysis" target

```
set(analysis_TARGETS "${analysis_TARGETS}" PARENT_SCOPE)
```