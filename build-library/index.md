# Build a library

In addition to compiling executable applications, CMake also supports generating library artifacts. Use the `add_library()` function to define a `STATIC` library (`.a` or `.lib`) or a `SHARED` library (`.so` or `.dll`). This is similar to `add_executable()`.

<<< ./CMakeLists.txt{3,4 cmake}

<<< ./my-lib.c

```sh
cmake -B build
cmake --build build
file build/my-lib.a
file build/my-lib.so
```

Note that the `add_library()` declaration makes use of CMake syntax that doesn't look like what you might be used to in other languages like C, C++, or Python. The `STATIC` and `SHARED` enum-like words fit into the `<type>` slot in the function definition.

> **`add_library(<name> [<type>] [EXCLUDE_FROM_ALL] <sources>...)`**
>
> Add a library target called `<name>` to be built from the source files listed in the command invocation.
>
> The optional `<type>` specifies the type of library to be created:
>
> - **`STATIC`:** An archive of object files for use when linking other targets.
> - **`SHARED`:** A dynamic library that may be linked by other targets and loaded at runtime.
>
> If no `<type>` is given the default is `STATIC` or `SHARED` based on the value of the [`BUILD_SHARED_LIBS`](https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html#variable:BUILD_SHARED_LIBS) variable.

&mdash; [add_library | CMake Documentation](https://cmake.org/cmake/help/latest/command/add_library.html)

You can compile libraries using the same `cmake -B build` and `cmake --build build` incantation as was used in the executable example. The output formats and how the compilation process happens is all defined by the `CMakeLists.txt` file and not command arguments.