---
# https://vitepress.dev/reference/frontmatter-config
titleTemplate: false
---

<b>CMake by Example</b> is a hands-on introduction to CMake using annotated
example projects. Get started with [the hello world example] or click on any of
the links below. You are encouraged to copy-paste bits from these examples into
your own projects as needed.

[CMake] is the de-facto standard for building C++ code, with over 2 million
downloads a month. It’s a powerful, comprehensive solution for managing the
software build process.

<div class="grr-wrapper">
<div class="grr">

### 🚩 Basics

- [Build an executable](/executable/)
- [Build a static library](/static/)
- [Build a shared library](/shared/)
- [Print messages](/print/)
- [Conditional if/else](/if-else/)
- [Add an include folder](/include/)
- [Set C/C++ standard](/set-standard/)
- [Multiple targets](/multiple/)

</div>
<div class="grr">

### 📚 Using libraries

- [Use SDL via Git submodule](/sdl-submodule/)
- [Use cpr via FetchContent](/cpr-fetchcontent/)
- [Use {fmt} via CPM](/fmt-cpm/)
- [Use Boost via Conan](/boost-conan/)
- [Use FTXUI via Vcpkg](/ftxui-vcpkg/)
- [Use GTK via APT](/gtk-apt/)

</div><div class="grr">

### 🧪 Testing & analysis

- [Test with GTest via CPM](/gtest-cpm/)
- [Test with CTest via CPM](/unity-cpm/)
- [Test with Boost.Test via CPM](/boost-test-cpm/)
- [Format with clang-format](/clang-format/)
- [Lint with clang-tidy](/clang-tidy/)

</div><div class="grr">

### ⚙️ Advanced

- [Installers](/installers/)
- [Configure files](/configure/)
- [Protobuf codegen](/protobuf-codegen/)
- [CMake presets](/presets/)
- [Subprojects](/subprojects/)
- [Build target if option passed](/if-option/)
- [Use Clang to compile](/use-clang/)
- [Cross-compiling](/cross-compile/)

</div></div>

<hr style="margin-top: 2.3em;" />

This project is inspired by [Go by Example], [JavaScript by Example], [Haskell
by Example], [Deno by Example], [C by Example], and [Makefile Tutorial by
Example].

👀 Want more CMake? Check out [onqtam/awesome-cmake]!

[cmake]: https://cmake.org/
[the hello world example]: /executable/
[onqtam/awesome-cmake]: https://github.com/onqtam/awesome-cmake
[Go by Example]: https://gobyexample.com/
[JavaScript by Example]: https://javascriptbyexample.com/
[Haskell by Example]: https://lotz84.github.io/haskellbyexample/
[Deno by Example]: https://examples.deno.land/
[C by Example]: https://www.cbyexample.com/
[Makefile Tutorial by Example]: https://makefiletutorial.com/

<style scoped>
@media screen and (min-width: 600px) {
  .grr-wrapper {
    display: flex;
    flex-wrap: wrap;
  }
  .grr {
    flex: 0 0 calc(50% - 20px); /* Adjust the width as needed */
    margin: 10px;
  }
}
</style>
