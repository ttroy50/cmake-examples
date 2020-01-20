# Locate cppcheck
#
# This module defines
#  CPPCHECK_BIN, where to find cppcheck
#
# To help find the binary you can set CPPCHECK_ROOT_DIR to search a custom path
# Exported argumets include
#   CPPCHECK_FOUND, if false, do not try to link to cppcheck --- if (CPPCHECK_FOUND)
#   
#   CPPCHECK_THREADS_ARG - Number of threads to use (e.g. -j 3)
#   CPPCHECK_PROJECT_ARG - The project to use (compile_comands.json)
#   CPPCHECK_BUILD_DIR_ARG - The build output directory
#   CPPCHECK_ERROR_EXITCODE_ARG - The exit code if an error is found
#   CPPCHECK_SUPPRESSIONS - A suppressiosn file to use
#   CPPCHECK_CHECKS_ARGS - The checks to run
#   CPPCHECK_OTHER_ARGS - Any other arguments
#   CPPCHECK_COMMAND - The full command to run the default cppcheck configuration
#   CPPCHECK_EXCLUDES - A list of files or folders to exclude from the scan. Must be the full path
#   
# if CPPCHECK_XML_OUTPUT is set before calling this. CppCheck will create an xml file with that name
# find the cppcheck binary

# if custom path check there first
if(CPPCHECK_ROOT_DIR)
    find_program(CPPCHECK_BIN 
        NAMES
        cppcheck
        PATHS
        "${CPPCHECK_ROOT_DIR}"
        NO_DEFAULT_PATH)
endif()

find_program(CPPCHECK_BIN NAMES cppcheck)

if(CPPCHECK_BIN)
    execute_process(COMMAND ${CPPCHECK_BIN} --version
                  OUTPUT_VARIABLE CPPCHECK_VERSION
                  ERROR_QUIET
                  OUTPUT_STRIP_TRAILING_WHITESPACE)

    set(CPPCHECK_THREADS_ARG "-j4" CACHE STRING "The number of threads to use")
    set(CPPCHECK_PROJECT_ARG "--project=${PROJECT_BINARY_DIR}/compile_commands.json")
    set(CPPCHECK_BUILD_DIR_ARG "--cppcheck-build-dir=${PROJECT_BINARY_DIR}/analysis/cppcheck" CACHE STRING "The build directory to use")
    # Don't show these errors
    if(EXISTS "${CMAKE_SOURCE_DIR}/.cppcheck_suppressions")
        set(CPPCHECK_SUPPRESSIONS "--suppressions-list=${CMAKE_SOURCE_DIR}/.cppcheck_suppressions" CACHE STRING "The suppressions file to use")
    else()
        set(CPPCHECK_SUPPRESSIONS "" CACHE STRING "The suppressions file to use")
    endif()

    # Show these errors but don't fail the build
    # These are mainly going to be from the "warning" category that is enabled by default later
    if(EXISTS "${CMAKE_SOURCE_DIR}/.cppcheck_exitcode_suppressions")
        set(CPPCHECK_EXITCODE_SUPPRESSIONS "--exitcode-suppressions=${CMAKE_SOURCE_DIR}/.cppcheck_exitcode_suppressions" CACHE STRING "The exitcode suppressions file to use")
    else()
        set(CPPCHECK_EXITCODE_SUPPRESSIONS "" CACHE STRING "The exitcode suppressions file to use")
    endif()

    set(CPPCHECK_ERROR_EXITCODE_ARG "--error-exitcode=1" CACHE STRING "The exitcode to use if an error is found")
    set(CPPCHECK_CHECKS_ARGS "--enable=warning" CACHE STRING "Arguments for the checks to run")
    set(CPPCHECK_OTHER_ARGS "" CACHE STRING "Other arguments")
    set(_CPPCHECK_EXCLUDES)

    foreach(ex ${CPPCHECK_EXCLUDES})
        list(APPEND _CPPCHECK_EXCLUDES "-i${ex}")
    endforeach(ex)

    set(CPPCHECK_ALL_ARGS 
        ${CPPCHECK_THREADS_ARG} 
        ${CPPCHECK_PROJECT_ARG} 
        ${CPPCHECK_BUILD_DIR_ARG} 
        ${CPPCHECK_ERROR_EXITCODE_ARG} 
        ${CPPCHECK_SUPPRESSIONS} 
        ${CPPCHECK_EXITCODE_SUPPRESSIONS}
        ${CPPCHECK_CHECKS_ARGS} 
        ${CPPCHECK_OTHER_ARGS}
        ${_CPPCHECK_EXCLUDES}
    )

    if(NOT CPPCHECK_XML_OUTPUT)
        set(CPPCHECK_COMMAND 
            ${CPPCHECK_BIN}
            ${CPPCHECK_ALL_ARGS}
        )
    else()
        set(CPPCHECK_COMMAND
            ${CPPCHECK_BIN}
            ${CPPCHECK_ALL_ARGS}
            --xml 
            --xml-version=2
            2> ${CPPCHECK_XML_OUTPUT})
    endif()
    
endif()



# handle the QUIETLY and REQUIRED arguments and set YAMLCPP_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
    CPPCHECK 
    DEFAULT_MSG 
    CPPCHECK_BIN)

mark_as_advanced(
    CPPCHECK_BIN  
    CPPCHECK_THREADS_ARG
    CPPCHECK_PROJECT_ARG
    CPPCHECK_BUILD_DIR_ARG
    CPPCHECK_ERROR_EXITCODE_ARG
    CPPCHECK_SUPPRESSIONS
    CPPCHECK_CHECKS_ARGS
    CPPCHECK_OTHER_ARGS)

if(CPPCHECK_FOUND)
    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/analysis/cppcheck)
    add_custom_target(cppcheck-analysis 
        COMMAND ${CPPCHECK_COMMAND})
    message("cppcheck found. Use cppccheck-analysis targets to run it")
else()
    message("cppcheck not found. No cppccheck-analysis targets")
endif()
