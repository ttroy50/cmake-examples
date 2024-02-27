---
titleTemplate: false
---

<b>CMake by Example</b> is a hands-on introduction to CMake using annotated
example projects. Get started with [the hello world example](/executable/) or click on any of
the links below. You are encouraged to copy-paste bits from these examples into
your own projects as needed.

[CMake](https://cmake.org/) is the de-facto standard for building C++ code, with over 2 million downloads a month. It’s a powerful, comprehensive solution for managing the software build process.

<div class="mygrid">
<div class="mygrid-item">

### 🚩 Basics

- [Build an executable](/build-executable/)
- [Build a static library](/build-static-library/)
- [Build a shared library](/build-shared-library/)
- [Conditional if/else](/if-else/)
- [Print a message](/print-message/)
- [Print a warning](/print-message/#print-a-warning)
- [Print an error](/print-message/#print-an-error)
- [Add an include folder](/add-include-folder/)
- [Set C++ standard](/set-cpp-standard/)
- [Set C standard](/set-cpp-standard/#set-c-standard)
- [Build multiple targets](/build-multiple-targets/)

</div>
<div class="mygrid-item">

### 📚 Using libraries

- ~~[Use SDL via Git submodule](/sdl-submodule/)~~
- ~~[Use cpr via FetchContent](/cpr-fetchcontent/)~~
- ~~[Use {fmt} via CPM](/fmt-cpm/)~~
- ~~[Use Boost via Conan](/boost-conan/)~~
- ~~[Use FTXUI via Vcpkg](/ftxui-vcpkg/)~~
- ~~[Use GTK via APT](/gtk-apt/)~~

</div><div class="mygrid-item">

### 🧪 Testing & analysis

- ~~[Test with GTest via CPM](/gtest-cpm/)~~
- ~~[Test with CTest via CPM](/unity-cpm/)~~
- ~~[Test with Boost.Test via CPM](/boost-test-cpm/)~~
- ~~[Format with clang-format](/clang-format/)~~
- ~~[Lint with clang-tidy](/clang-tidy/)~~

</div><div class="mygrid-item">

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

<style scoped>
@media screen and (min-width: 600px) {
  .mygrid {
    display: flex;
    flex-wrap: wrap;
  }
  .mygrid-item {
    flex: 0 0 calc(50% - 20px); /* Adjust the width as needed */
    margin: 10px;
  }
}
</style>
