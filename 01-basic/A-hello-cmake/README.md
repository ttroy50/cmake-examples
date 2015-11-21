# Hello CMake

Shows a very basic hello world example.

## New Concepts

### Minimum CMake version

```cmake
cmake_minimum_required(VERSION 2.6)
```

When creating a project using CMake, you can specify the minimum version of CMake that is supported. 


### Projects

```cmake
project (hello_cmake)
```

A CMake build can include a project name to make referencing certain variables when using multiple projects.

### Creating an executable

```cmake
add_executable(hello_cmake main.cpp)
```

The add_executable() command specifies that an executable should be build from the specified source files, in this example main.cpp. The first argument to the add_executable() function is the name of the executable to be built, and the second argument is the source file from which to build the executable.

HINT: A shorthand that some people use is to have the project name and executable name the same. This allows you to specify the CMakeLists.txt as follows,
 
```cmake
cmake_minimum_required(VERSION 2.6)
project (hello_cmake)
add_executable(${PROJECT_NAME} main.cpp)
```

In this example, the project() function, will create a variable ${PROJECT_NAME} with the value hello_cmake. This can then be passed to the add_executable() function to output a 'hello_cmake' executable.

## Building the example

```bash
$ mkdir build

$ cd build

$ cmake ..
-- The C compiler identification is GNU 4.8.4
-- The CXX compiler identification is GNU 4.8.4
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Configuring done
-- Generating done
-- Build files have been written to: /workspace/cmake-examples/01-basic/hello_cmake/build

$ make
Scanning dependencies of target hello_cmake
[100%] Building CXX object CMakeFiles/hello_cmake.dir/hello_cmake.cpp.o
Linking CXX executable hello_cmake
[100%] Built target hello_cmake

$ ./hello_cmake 
Hello CMake!
```

