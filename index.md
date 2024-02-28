---
titleTemplate: false
---

<b>CMake by Example</b> is a hands-on introduction to CMake using annotated
example projects. Get started with [the hello world example](/executable/) or click on any of
the links below. You are encouraged to copy-paste bits from these examples into
your own projects as needed.

[CMake](https://cmake.org/) is the de-facto standard for building C++ code, with over 2 million downloads a month. It’s a powerful, comprehensive solution for managing the software build process.

<div :class="$style.grid"><div :class="$style.gridItem">

### 🚩 Basics

- [Build an executable](/build-executable/)
- [Build a static library](/build-library/)
- [Build a shared library](/build-library/)
- [Build multiple targets](/build-multiple-targets/)
- [Conditional if/else](/if-else/)
- [Print a message](/print-message/)
- [Print a warning](/print-message/)
- [Print an error](/print-message/)
- [Add an include folder](/add-include-folder/)
- [Set C++ standard](/set-cpp-standard/)
- [Set C standard](/set-cpp-standard/)

</div><div :class="$style.gridItem">

### 📚 Libraries

- ~~[Use a library via Git submodule](/use-library-submodule/)~~
- [Use a library via FetchContent](/use-library-fetchcontent/)
- [Use a library via CPM.cmake](/use-library-cpm/)
- ~~[Use a library via Conan](/use-library-conan/)~~
- [Use a library via Vcpkg](/use-library-vcpkg/)
- ~~[Use a library via APT](/use-library-apt/)~~

</div><div :class="$style.gridItem">

### 🧰 Tooling

- ~~[Test with GTest](/gtest/)~~
- ~~[Test with CTest](/ctest/)~~
- ~~[Test with Boost.Test](/boost-test/)~~
- [Format with clang-format](/clang-format/)
- ~~[Lint with clang-tidy](/clang-tidy/)~~

</div><div :class="$style.gridItem">

### ⚙️ Advanced

- ~~[Installers](/installers/)~~
- ~~[Configure files](/configure/)~~
- ~~[Protobuf codegen](/protobuf-codegen/)~~
- ~~[CMake presets](/presets/)~~
- ~~[Subprojects](/subprojects/)~~
- ~~[Build target if option passed](/if-option/)~~
- ~~[Use Clang to compile](/use-clang/)~~
- ~~[Cross-compiling](/cross-compile/)~~

</div></div>

<br />
<hr />

This project is inspired by [Go by Example](https://gobyexample.com/), [JavaScript by Example](https://javascriptbyexample.com/), [Haskell by Example](https://lotz84.github.io/haskellbyexample/), [Deno by Example](https://examples.deno.land/), [C by Example](https://www.cbyexample.com/), and [Makefile Tutorial by Example](https://makefiletutorial.com/).

👀 Want more CMake? Check out [onqtam/awesome-cmake](https://github.com/onqtam/awesome-cmake)!

<style module>
@media screen and (min-width: 600px) {
  .grid {
    display: flex;
    flex-wrap: wrap;
  }
  .gridItem {
    flex: 0 0 calc(50% - 20px); /* Adjust the width as needed */
    margin: 10px;
  }
}
</style>
