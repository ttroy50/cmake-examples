# Add an include folder

Sometimes you want to add an arbitrary folder to your projects include path. The simplest way to do this is with the `include_directories` command.

<<< ./CMakeLists.txt{3 cmake}

::: code-group

<<< ./src/main.c{1} [src/main.c]

<<< ./include/greet.h{2 c} [include/greet.h]

<<< ./src/greet.c [src/greet.c]

:::

```sh
cmake -B build
cmake --build build
./build/my-app
```

## 🆕 The better way

The `include_directories()` command adds the specified directories to the include path of _all_ targets in the current directory scope. This is fine for small projects, but it can become unwieldy as your project grows. The `target_include_directories()` command is a more granular alternative that allows you to specify the include path for a single target.

For example, this `CMakeLists.txt` file is equivalent to the one above:

```cmake{4}
cmake_minimum_required(VERSION 3.28)
project(my-project)
add_executable(my-app src/main.c src/greet.c)
target_include_directories(my-app PRIVATE include)
```

ℹ Notice how we use the target name that was declared & defined by `add_executable()` again in `target_include_directories()` to _only affect that executable target_. You must put any `add_executable()` or `add_library()` declarations _before_ `target_include_directories()` so that the target is defined by the time the interpreter gets to the `target_include_directories()` function.

<details><summary>What's the <code>PRIVATE</code> argument for?</summary>

It's a required argument. The enum options are `PUBLIC`, `PRIVATE`, and `INTERFACE`.

> The `INTERFACE`, `PUBLIC` and `PRIVATE` keywords are required to specify the scope of the following arguments. `PRIVATE` and `PUBLIC` items will populate the `INCLUDE_DIRECTORIES` property of `<target>`. `PUBLIC` and `INTERFACE` items will populate the `INTERFACE_INCLUDE_DIRECTORIES` property of `<target>`. The following arguments specify include directories.

</details>

[📚 CMake documentation on `include_directories()`](https://cmake.org/cmake/help/latest/command/include_directories.html) \
[📚 CMake documentation on `target_include_directories()`](https://cmake.org/cmake/help/latest/command/target_include_directories.html)
