# Set C++ standard

The easiest way to quickly set a the C++ standard for your project globally is to use the `set(CMAKE_CXX_STANDARD)` directive. You can also **require** that version (instead of making it a recommendation) using `set(CMAKE_CXX_STANDARD_REQUIRED TRUE)`.

<<< ./CMakeLists.txt{cmake}

<<< ./main.cpp

```sh
cmake -B build
cmake --build build
./build/my-app
#=> 202002
```

> **`__cplusplus`:** denotes the version of C++ standard that is being used, expands to value `199711L`(until C++11), `201103L`(C++11), `201402L`(C++14), `201703L`(C++17), `202002L`(C++20), or `202302L`(C++23)

&mdash; [Replacing text macros - cppreference.com](https://en.cppreference.com/w/cpp/preprocessor/replace#:~:text=every%20translation%20unit%3A-,__cplusplus,-denotes%20the%20version)

## Set C standard

You can do a similar thing to set the C standard which is different than the C++ standard. Use `CMAKE_C_STANDARD` instead:

```cmake
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED TRUE)
add_executable(app1 src/main1.c)
```

## 🆕 The better way

The newer way to set the C++ standard for a specific target (like `add_executable()`) is to use `target_compile_features()` to only switch on/off C++XY version features per-target instead of globally.

```cmake
cmake_minimum_required(VERSION 3.28)
project(my-project)
add_executable(my-app main.cpp)
target_compile_features(my-app PRIVATE cxx_std_20)
```

Note that now we have to declare the target up-front and then switch on C++20 for that specific target. This is generally superior to turning C++XY features on globally so that your CMake configuration doesn't affect any other targets without explicitly meaning to.

You can use `target_compile_features()` for C standard versions too:

```cmake
cmake_minimum_required(VERSION 3.28)
project(my-project)
add_executable(my-app main.c)
target_compile_features(my-app PRIVATE c_std_17)
```

There's a list of enum values that can used in `target_compile_features()` across three pages: [`CMAKE_C_KNOWN_FEATURES`](https://cmake.org/cmake/help/latest/prop_gbl/CMAKE_C_KNOWN_FEATURES.html#prop_gbl:CMAKE_C_KNOWN_FEATURES), [`CMAKE_CUDA_KNOWN_FEATURES`](https://cmake.org/cmake/help/latest/prop_gbl/CMAKE_CUDA_KNOWN_FEATURES.html#prop_gbl:CMAKE_CUDA_KNOWN_FEATURES), and [`CMAKE_CXX_KNOWN_FEATURES`](https://cmake.org/cmake/help/latest/prop_gbl/CMAKE_CXX_KNOWN_FEATURES.html#prop_gbl:CMAKE_CXX_KNOWN_FEATURES). The most useful ones are `cxx_std_${XY}` where `${XY}` indicates a C++ standard number like `20`. and `c_std_${XY}` where `${XY}` indicates a C standard number like `17`.
