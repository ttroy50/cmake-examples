# Add an include folder

Sometimes you want to add an arbitrary folder to your projects include path. The
simplest way to do this is with the `include_directories` command.

<<< ./CMakeLists.txt{3 cmake}

<details><summary><code>include/greet.h</code></summary>

<<< ./include/greet.h{c}

</details>

<details><summary><code>src/greet.c</code></summary>

<<< ./src/greet.c{1}

</details>

<details open><summary><code>src/main.c</code></summary>

<<< ./src/main.c{1}

</details>

```sh
cmake -B build
cmake --build build
```

<iframe frameborder="0" height="400" style="width: 100%" src="https://replit.com/@jcbhmr/cmakebyexampledev-add-include-folder?embed=1#CMakeLists.txt"></iframe>

## `include_directories()` vs `target_include_directories()`

The `include_directories()` command adds the specified directories to the
include path of _all_ targets in the current directory scope. This is fine for
small projects, but it can become unwieldy as your project grows. The
`target_include_directories()` command is a more granular alternative that
allows you to specify the include path for a single target.

For example, this `CMakeLists.txt` file is equivalent to the one above:

```cmake{4}
cmake_minimum_required(VERSION 3.10)
project(my-project)
add_executable(my-app src/main.c src/greet.c)
target_include_directories(my-app PRIVATE include) // [!code focus]
```

<details><summary>What's the <code>PRIVATE</code> argument for?</summary>

It's a required argument. The enum options are `PUBLIC`, `PRIVATE`, and
`INTERFACE`.

> The `INTERFACE`, `PUBLIC` and `PRIVATE` keywords are required to specify the
> scope of the following arguments. `PRIVATE` and `PUBLIC` items will populate
> the `INCLUDE_DIRECTORIES` property of `<target>`. `PUBLIC` and `INTERFACE`
> items will populate the `INTERFACE_INCLUDE_DIRECTORIES` property of
> `<target>`. The following arguments specify include directories.

</details>

<!-- prettier-ignore -->
[📚 CMake documentation on `include_directories()`](https://cmake.org/cmake/help/latest/command/include_directories.html) \
[📚 CMake documentation on `target_include_directories()`](https://cmake.org/cmake/help/latest/command/target_include_directories.html)
