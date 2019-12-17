
= CMake Examples
:toc:
:toc-placement!:

toc::[]

# Introduction

https://cmake.org/[CMake] is a cross-platform open-source meta-build system which
can build, test and package software. It can be used to support multiple native build environments including
make, Apple's xcode and Microsoft Visual Studio.

This repository includes some example modern CMake configurations which I have picked up
when exploring it's usage for various projects. The examples are laid out in a tutorial like format.
The first examples are very basic and slowly increase in complexity drawing on previous examples to show
more complex use cases.

These examples have been tested on Ubuntu 16.04 but should work under any Linux system that supports CMake v3.5+.

This branch works with the CMake version 3.5 onwards. 

* For examples that use CMake version 2.x see the branch link:https://github.com/ttroy50/cmake-examples/tree/v2-style-includes[v2-style-includes].
* For examples that use CMake version 3.0 see the branch link:https://github.com/ttroy50/cmake-examples/tree/v3.0-minimum[v3.0-minimum]

image:https://travis-ci.org/ttroy50/cmake-examples.svg?branch=master["Build Status", link="https://travis-ci.org/ttroy50/cmake-examples"]

# Requirements

The basic requirements for most examples are:

* CMake v3.5+
* A c++ compiler (defaults to gcc)
* make

## Installation on Ubuntu

The easiest way to install the above on Ubuntu is as follows

[source,bash]
----
$ sudo apt-get install build-essential
$ sudo apt-get install cmake
----

Some specific examples may require other tools including:

* http://www.boost.org/[boost]

  $ sudo apt-get install libboost-all-dev

* https://github.com/google/protobuf[protobuf]

  $ sudo apt-get install libprotobuf-dev
  $ sudo apt-get install protobuf-compiler

* http://cppcheck.sourceforge.net/[cppcheck]

  $ sudo apt-get install cppcheck

* http://clang.llvm.org/[clang]

  $ sudo apt-get install clang-3.6

* https://ninja-build.org/[ninja]

  $ sudo apt-get install ninja-build

* link:https://conan.io[conan]

  $ sudo apt-get install python3 python3-pip
  $ sudo pip3 install conan

## Docker

Docker containers with all requirements and various versions of CMake are generated to help make testing the examples easier. These are available from the docker hub repository link:https://hub.docker.com/r/matrim/cmake-examples/[matrim/cmake-examples].

To build the full set of cmake-examples test cases you can run:

[source,bash]
----
docker run -it matrim/cmake-examples:3.5.1
cd ~ 
git clone https://github.com/ttroy50/cmake-examples.git code
cd code
./test.sh
----

For more details on build and running the docker containers link:here[dockerfiles].

# Other Links

There are many CMake tutorials and examples online. The list below includes links
to some of these which I have found helpful in my CMake journey.

  * https://web.archive.org/web/20160314094326/https://www.kdab.com/~stephen/moderncmake.pdf[Modern CMake Slides]
  * https://rix0r.nl/blog/2015/08/13/cmake-guide/[rix0r Modern CMake Blog]
  * https://cmake.org/cmake-tutorial/[Official CMake Tutorial]
  * https://gitlab.kitware.com/cmake/community/wikis/home[Official CMake Wiki]
  * https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/Useful-Variables[CMake Useful Variables]
  * http://derekmolloy.ie/hello-world-introductions-to-cmake/[Derek Molloy - Intro to CMake]
  * http://techminded.net/blog/modular-c-projects-with-cmake.html[Modular C++ Projects]
  * https://web.archive.org/web/20190320121339/http://voices.canonical.com/jussi.pakkanen/2013/03/26/a-list-of-common-cmake-antipatterns/[Common CMake Anti-Patterns]
  * http://baptiste-wicht.com/posts/2014/04/install-use-clang-static-analyzer-cmake.html[Using clang static analyser with CMake]
  * https://cmake.org/pipermail/cmake/2011-April/043709.html[Static Analysis with CDash] - Includes some info about using CppCheck with CMake
  * https://samthursfield.wordpress.com/2015/10/20/some-cmake-tips/[CMake Tips]
  * https://www.johnlamp.net/cmake-tutorial.html[John Lamp - CMake Tutorial]
  * link:https://docs.conan.io[Conan Documentation]
