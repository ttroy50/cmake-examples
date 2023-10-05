# Build an executable

Instead of running `cc main.c -o myapp`, the "hello world" for a CMake project
is a bit more involved. You need to create an additional `CMakeLists.txt` file
that tells CMake what to do. Use the `add_executable()` function to define a
`myapp` target that CMake implicitly knows how to build from the given `main.c`
file.

<<< ./CMakeLists.txt{cmake}

<<< ./main.c

<!-- TODO: Explain why 'cmake -B build' and 'cmake --build build' -->

```sh
cmake -B build
cmake --build build
./build/myapp
```

<iframe frameborder="0" style="width: 100%; height: 500px" src="https://replit.com/@jcbhmr/cmakebyexampledev-executable?embed=1"></iframe>

<hr style="margin-top: 2.3em;" />

### What is a <dfn id="target">target</dfn>?

> Probably the most important item is targets. Targets represent executables,
> libraries, and utilities built by CMake. Every `add_library`,
> `add_executable`, and `add_custom_target` command creates a target. For
> example, the following command will create a target named “foo” that is a
> static library, with `foo1.c` and `foo2.c` as source files.
>
> ```cmake
> add_library(foo STATIC foo1.c foo2.c)
> ```

<!-- prettier-ignore -->
&mdash; [Key Concepts | CMake](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Key%20Concepts.html#:~:text=Targets%20represent%20executables%2C%20libraries%2C%20and,c%20and%20foo2.)
