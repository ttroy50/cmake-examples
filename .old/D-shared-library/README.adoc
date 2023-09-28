= Shared Library
:toc:
:toc-placement!:

toc::[]

# Introduction

Shows a hello world example which first creates and links a shared library.

This also shows how to create an link:https://cmake.org/cmake/help/v3.0/manual/cmake-buildsystem.7.html#alias-targets[alias target]

The files in this tutorial are below:

```
$ tree
.
├── CMakeLists.txt
├── include
│   └── shared
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp
```

  * link:CMakeLists.txt[] - Contains the CMake commands you wish to run
  * link:include/shared/Hello.h[] - The header file to include
  * link:src/Hello.cpp[] - A source file to compile
  * link:src/main.cpp[] - The source file with main


# Concepts

## Adding a Shared Library

As with the previous example on static libraries, the +add_library()+ function
is also used to create a shared library from some source files.
This is called as follows:

[source,cmake]
----
add_library(hello_library SHARED
    src/Hello.cpp
)
----

This will be used to create a shared library with the name libhello_library.so with
the sources passed to the +add_library()+ function.

## Alias Target

As the name suggests an link:https://cmake.org/cmake/help/v3.0/manual/cmake-buildsystem.7.html#alias-targets[alias target] is an alternative name for a target that can be used instead of the real target name in read-only contexts.

[source,cmake]
----
add_library(hello::library ALIAS hello_library)
----

As shown below, this allows you to reference the target using the alias name when linking it against other targets.

## Linking a Shared Library

Linking a shared library is the same as linking a static library. When creating your
executable use the the +target_link_library()+ function to point to your library

[source,cmake]
----
add_executable(hello_binary
    src/main.cpp
)

target_link_libraries(hello_binary
    PRIVATE
        hello::library
)
----

This tells CMake to link the hello_library against the hello_binary executable using the alias target name.

An example of this being called by the linker is

```
/usr/bin/c++ CMakeFiles/hello_binary.dir/src/main.cpp.o -o hello_binary -rdynamic libhello_library.so -Wl,-rpath,/home/matrim/workspace/cmake-examples/01-basic/D-shared-library/build
```

# Building the Example

[source,bash]
----
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
-- Build files have been written to: /home/matrim/workspace/cmake-examples/01-basic/D-shared-library/build

$ make
Scanning dependencies of target hello_library
[ 50%] Building CXX object CMakeFiles/hello_library.dir/src/Hello.cpp.o
Linking CXX shared library libhello_library.so
[ 50%] Built target hello_library
Scanning dependencies of target hello_binary
[100%] Building CXX object CMakeFiles/hello_binary.dir/src/main.cpp.o
Linking CXX executable hello_binary
[100%] Built target hello_binary

$ ls
CMakeCache.txt  CMakeFiles  cmake_install.cmake  hello_binary  libhello_library.so  Makefile

$ ./hello_binary
Hello Shared Library!
----
