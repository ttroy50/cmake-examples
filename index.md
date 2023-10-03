---
# https://vitepress.dev/reference/frontmatter-config
titleTemplate: false
---

# <img src="/favicon.ico" style="display:inline; height: 0.8em;">&#8201;CMake by example

> CMake is the de-facto standard for building C++ code, with over 2 million
> downloads a month. It’s a powerful, comprehensive solution for managing the
> software build process.

&mdash; [CMake.org](https://cmake.org/)

<b>CMake by Example</b> is a hands-on introduction to CMake using annotated
example `CMakeLists.txt` projects. Get started with [the hello world example] or
click on any of the links below. You are encouraged to copy-paste bits from
these examples into your own projects as needed.

[the hello world example]: /hello-world/

### Basic examples

<div class="responsive-columns">

- [Hello world!](/hello-world/)
- [Add an include folder](/add-include-folder/)
- [Two executable targets](/two-executables/)
- [Set C/C++ standard](/set-standard/)
- [CMakePresets.json](/cmakepresets-json/)

</div>

### Advanced examples

<div class="responsive-columns">

- [Using cpr via FetchContent](/cpr-fetchcontent/)
- [Using {fmt} via CPM.cmake](/fmt-cpm/)
- [Using GTest via Conan](/gtest-conan/)
- [Using FTXUI via Vcpkg](/ftxui-vcpkg/)

</div>

<hr style="margin-top: 2.3em;" />

This project is inspired by [Go by Example], [JavaScript by Example], [Haskell
by Example], [Deno by Example], [C by Example], and [Makefile Tutorial by
Example].

[Go by Example]: https://gobyexample.com/
[JavaScript by Example]: https://javascriptbyexample.com/
[Haskell by Example]: https://lotz84.github.io/haskellbyexample/
[Deno by Example]: https://examples.deno.land/
[C by Example]: https://www.cbyexample.com/
[Makefile Tutorial by Example]: https://makefiletutorial.com/

### More resources

- [C/C++ by example](https://www.cbyexample.com/)
- [Makefile Tutorial by Example](https://makefiletutorial.com/)
- [CMake Cookbook](https://github.com/dev-cafe/cmake-cookbook)
- [CPM.cmake: CMake's missing package manager](https://github.com/cpm-cmake/CPM.cmake)
- [Conan: C/C++ Package Manager](https://conan.io/)
- [Vcpkg: C++ Library Manager](https://vcpkg.io/en/index.html)

<template><!-- Dummy Vue SFC --></template>

<style scoped>
@media (min-width: 600px) {
  .responsive-columns {
    column-count: 2;
  }
}
.emoji-font {
  font-family: system-ui, "Segoe UI", Roboto, Helvetica, Arial, sans-serif,
    "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
</style>
