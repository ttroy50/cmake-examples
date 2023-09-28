# Hello world!

The most basic CMake project consists of a `CMakeLists.txt` file and a `main.c`
file. CMake uses [targets](#what-is-a-target) to represent executables,
libraries, and utilities. The following example creates a target named
`hello-world` that is an executable with `main.c` as its sole source file. The
compiled executable will be named `hello-world` on Linux and `hello-world.exe`
on Windows and is placed (somewhere) in the `build` directory.

<<< ./CMakeLists.txt{4 cmake}

<<< ./main.c{c}

```sh
# Generate the Ninja, Make, or Visual Studio project files:
cmake -B build

# Run the Ninja, Make, or Visual Studio build system:
cmake --build build
```

<iframe frameborder="0" style="width: 100%; height: 600px" src="https://replit.com/@jcbhmr/VeneratedSpringgreenShell?embed=1#CMakeLists.txt" width="600" height="400"></iframe>

## What is a <dfn>target</dfn>?

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
