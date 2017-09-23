= Google Test Unit Testing Framework
:toc:
:toc-placement!:

toc::[]


# Introduction

Using link:https://cmake.org/Wiki/CMake/Testing_With_CTest[CTest] you can generate
a `make test` target to run automated unit-tests. This example shows how to
download and build the link:https://github.com/google/googletest[google test] library,
create tests and run them.

The files in this tutorial are below:

```
$ tree
.
├── 3rd_party
│   └── google-test
│       ├── CMakeLists.txt
│       └── CMakeLists.txt.in
├── CMakeLists.txt
├── Reverse.h
├── Reverse.cpp
├── Palindrome.h
├── Palindrome.cpp
├── unit_tests.cpp
```

  * link:3rd_party/google-test/CMakeLists.txt[] - CMake commands to build and prepare the google test library
  * link:3rd_party/google-test/CMakeLists.txt.in[] - Helper script to do the download of google test
  * link:CMakeLists.txt[] - Contains the CMake commands you wish to run
  * link:Reverse.h[] / link:Reverse.cpp[.cpp] - Class to reverse a string
  * link:Palindrome.h[] / link:Palindrome.cpp[.cpp] - Class to test if a string is a palindrome
  * link:unit_test.cpp[] - Unit Tests using google test unit test framework

# Requirements

An internet connection. This example will download the google test library the first time you run the CMake configure step. See the 
link:https://github.com/google/googletest/blob/master/googletest/README.md[google test readme] and link:http://crascit.com/2015/07/25/cmake-gtest/[here] for details. 

# Concepts

## Download and Build Google Test

[source,cmake]
----
add_subdirectory(3rd_party/google-test)
----

This will add the CMake files which download and build Google Test. This is the recommended way to add google test and there are 
more details from link:https://github.com/google/googletest/blob/master/googletest/README.md[google test readme] and link:http://crascit.com/2015/07/25/cmake-gtest/[here]

Alternatives to this method include:

  * Use something like `git submodule` to download the source to a folder in your tree and then do `add_subdirectory`
  * Vendor the google test source code within your repository
  * Build google test externally and link it using `find_package(GTest)` - Not recommended by the google test authors anymore

## Enabling testing

To enable testing you must include the following line in your top level CMakeLists.txt

[source,cmake]
----
enable_testing()
----

This will enable testing for the current folder and all folders below it.

## Adding a testing executable

The requirement for this step will depend on your unit-test framework. In the example
of google test, you can create binary(s) which includes all the unit tests that you want to run.

[source,cmake]
----
add_executable(unit_tests unit_tests.cpp)

target_link_libraries(unit_tests
    example_google_test
    GTest::GTest
    GTest::main
)
----

In the above code, a unit test binary is added, which links against the google test unit-test-framework using the
ALIAS target setup during the link:3rd_party/google-test/CMakeLists.txt[download and build] of GTest.

## Add A test

To add a test you call the link:https://cmake.org/cmake/help/v3.0/command/add_test.html[`add_test()`] function.
This will create a named test which will run the supplied command.

[source,cmake]
----
add_test(test_all unit_tests)
----

In this example, we create a test called `test_all` which will run the executable
created by the `unit_tests` executable created from the call to `add_executable`

# Building the Example

[source,bash]
----
$ mkdir build

$ cd build/

$ cmake ..
-- The C compiler identification is GNU 5.4.0
-- The CXX compiler identification is GNU 5.4.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /data/data/code/cmake-examples/05-unit-testing/google-test-download/build/3rd_party/google-test/googletest-download
Scanning dependencies of target googletest
[ 11%] Creating directories for 'googletest'
[ 22%] Performing download step (download, verify and extract) for 'googletest'
-- downloading...
     src='https://github.com/google/googletest/archive/bfc0ffc8a698072c794ae7299db9cb6866f4c0bc.tar.gz'
     dst='/data/data/code/cmake-examples/05-unit-testing/google-test-download/build/3rd_party/google-test/googletest-download/googletest-prefix/src/bfc0ffc8a698072c794ae7299db9cb6866f4c0bc.tar.gz'
     timeout='none'
-- downloading... done
-- verifying file...
     file='/data/data/code/cmake-examples/05-unit-testing/google-test-download/build/3rd_party/google-test/googletest-download/googletest-prefix/src/bfc0ffc8a698072c794ae7299db9cb6866f4c0bc.tar.gz'
-- verifying file... warning: did not verify file - no URL_HASH specified?
-- extracting...
     src='/data/code/cmake-examples/05-unit-testing/google-test-download/build/3rd_party/google-test/googletest-download/googletest-prefix/src/bfc0ffc8a698072c794ae7299db9cb6866f4c0bc.tar.gz'
     dst='/data/code/cmake-examples/05-unit-testing/google-test-download/build/3rd_party/google-test/googletest-src'
-- extracting... [tar xfz]
-- extracting... [analysis]
-- extracting... [rename]
-- extracting... [clean up]
-- extracting... done
[ 33%] No patch step for 'googletest'
[ 44%] No update step for 'googletest'
[ 55%] No configure step for 'googletest'
[ 66%] No build step for 'googletest'
[ 77%] No install step for 'googletest'
[ 88%] No test step for 'googletest'
[100%] Completed 'googletest'
[100%] Built target googletest
-- Found PythonInterp: /usr/bin/python (found version "2.7.12") 
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Looking for pthread_create
-- Looking for pthread_create - not found
-- Check if compiler accepts -pthread
-- Check if compiler accepts -pthread - yes
-- Found Threads: TRUE  
-- Configuring done
-- Generating done
-- Build files have been written to: /data/code/cmake-examples/05-unit-testing/google-test-download/build

$ make
Scanning dependencies of target example_google_test
[  6%] Building CXX object CMakeFiles/example_google_test.dir/Reverse.cpp.o
[ 12%] Building CXX object CMakeFiles/example_google_test.dir/Palindrome.cpp.o
[ 18%] Linking CXX static library libexample_google_test.a
[ 18%] Built target example_google_test
Scanning dependencies of target gtest
[ 25%] Building CXX object 3rd_party/google-test/googletest-build/googlemock/gtest/CMakeFiles/gtest.dir/src/gtest-all.cc.o
[ 31%] Linking CXX static library libgtest.a
[ 31%] Built target gtest
Scanning dependencies of target gtest_main
[ 37%] Building CXX object 3rd_party/google-test/googletest-build/googlemock/gtest/CMakeFiles/gtest_main.dir/src/gtest_main.cc.o
[ 43%] Linking CXX static library libgtest_main.a
[ 43%] Built target gtest_main
Scanning dependencies of target unit_tests
[ 50%] Building CXX object CMakeFiles/unit_tests.dir/unit_tests.cpp.o
[ 56%] Linking CXX executable unit_tests
[ 56%] Built target unit_tests
Scanning dependencies of target gmock_main
[ 62%] Building CXX object 3rd_party/google-test/googletest-build/googlemock/CMakeFiles/gmock_main.dir/__/googletest/src/gtest-all.cc.o
[ 68%] Building CXX object 3rd_party/google-test/googletest-build/googlemock/CMakeFiles/gmock_main.dir/src/gmock-all.cc.o
[ 75%] Building CXX object 3rd_party/google-test/googletest-build/googlemock/CMakeFiles/gmock_main.dir/src/gmock_main.cc.o
[ 81%] Linking CXX static library libgmock_main.a
[ 81%] Built target gmock_main
Scanning dependencies of target gmock
[ 87%] Building CXX object 3rd_party/google-test/googletest-build/googlemock/CMakeFiles/gmock.dir/__/googletest/src/gtest-all.cc.o
[ 93%] Building CXX object 3rd_party/google-test/googletest-build/googlemock/CMakeFiles/gmock.dir/src/gmock-all.cc.o
[100%] Linking CXX static library libgmock.a
[100%] Built target gmock

$ make test
Running tests...
Test project /data/code/cmake-examples/05-unit-testing/google-test-download/build
    Start 1: test_all
1/1 Test #1: test_all .........................   Passed    0.00 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.00 sec
----

If the code is changed and it causes the unit tests to produce an error.
Then when running the tests you will see the following output.

[source,bash]
----
$ make test
Running tests...
Test project /data/code/cmake-examples/05-unit-testing/google-test-download/build
    Start 1: test_all
1/1 Test #1: test_all .........................***Failed    0.00 sec

0% tests passed, 1 tests failed out of 1

Total Test time (real) =   0.00 sec

The following tests FAILED:
    1 - test_all (Failed)
Errors while running CTest
Makefile:72: recipe for target 'test' failed
make: *** [test] Error 8
----
