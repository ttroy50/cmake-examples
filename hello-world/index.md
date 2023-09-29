# Hello world!

The most basic CMake project consists of a `CMakeLists.txt` file and a `main.c`
file. CMake uses [targets](#what-is-a-target) to represent executables,
libraries, and utilities. The following example creates a target named
`hello-world` that is an executable with `main.c` as its sole source file. The
compiled executable will be named `hello-world` on Linux and `hello-world.exe`
on Windows and is placed (somewhere) in the `build` directory.

<<< ./CMakeLists.txt{3 cmake}

<<< ./main.c

```sh{2,4}
# Generate the Ninja, Make, or Visual Studio project files:
cmake -B build
# Run the Ninja, Make, or Visual Studio build system:
cmake --build build
# Run the executable:
./build/hello-world
```

<iframe frameborder="0" height="400" style="width: 100%" src="https://replit.com/@jcbhmr/cmakebyexampledev-hello-world?embed=1#CMakeLists.txt"></iframe>

## What is a <dfn>target</dfn>?

It's a thing that's **built** by CMake. It can be an executable, a library, or a
utility. It can be built by itself or as part of a larger project. Targets can
even depend on other targets! Sometimes targets don't _actually_ produce
anything, but they're still useful for organizing build, installation, test, or
other steps.

```cmake{2,4,6}
# Create an executable target
add_executable(hi_exe main.c)
# Create a library target
add_library(hi_lib STATIC lib.c)
# Create a dummy target that runs a command
add_custom_target(hi_custom COMMAND echo "hi")
```

<details><summary>Excerpt from the CMake documentation</summary>

> Probably the most important item is targets. Targets represent executables,
> libraries, and utilities built by CMake. Every add_library, add_executable,
> and add_custom_target command creates a target. For example, the following
> command will create a target named “foo” that is a static library, with foo1.c
> and foo2.c as source files.
>
> ```cmake
> add_library(foo STATIC foo1.c foo2.c)
> ```

<!-- prettier-ignore -->
&mdash; [Key Concepts | CMake](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Key%20Concepts.html#:~:text=Targets%20represent%20executables%2C%20libraries%2C%20and,c%20and%20foo2.)

</details>
