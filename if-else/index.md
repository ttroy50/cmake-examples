# Conditional if/else

Inevitably you'll need to use `if()` condition checks to test if some condition is met. Common pre-defined variables to check include: [`WIN32`](https://cmake.org/cmake/help/latest/variable/WIN32.html), [`UNIX`](https://cmake.org/cmake/help/latest/variable/UNIX.html), [`APPLE`](https://cmake.org/cmake/help/latest/variable/APPLE.html), and [`CYGWIN`](https://cmake.org/cmake/help/latest/variable/CYGWIN.html). There are also a number of enum-like operators that can be used for comparisons. You can view the complete rundown on the [if | CMake Documentation](https://cmake.org/cmake/help/latest/command/if.html) page.

<<< ./CMakeLists.txt{cmake}

```sh
cmake -B build
cmake --build build
./build/my-app
```

Notice how the `elseif()` block uses the `STREQUAL` operator instead of a more common idiom like `==` to check if the [`CMAKE_SYSTEM_NAME`](https://cmake.org/cmake/help/latest/variable/CMAKE_SYSTEM_NAME.html) variable is equal to `"Linux"`.

Other common string operators include [`STRLESS`](https://cmake.org/cmake/help/latest/command/if.html#strless), [`STRGREATER`](https://cmake.org/cmake/help/latest/command/if.html#strgreater), [`STREQUAL`](https://cmake.org/cmake/help/latest/command/if.html#strequal), [`STRLESS_EQUAL`](https://cmake.org/cmake/help/latest/command/if.html#strless-equal), and [`STRGREATER_EQUAL`](https://cmake.org/cmake/help/latest/command/if.html#strgreater-equal). There's also a bunch of number operators like [`LESS`](https://cmake.org/cmake/help/latest/command/if.html#less), [`GREATER`](https://cmake.org/cmake/help/latest/command/if.html#greater), [`EQUAL`](https://cmake.org/cmake/help/latest/command/if.html#equal), [`LESS_EQUAL`](https://cmake.org/cmake/help/latest/command/if.html#less-equal), and [`GREATER_EQUAL`](https://cmake.org/cmake/help/latest/command/if.html#greater-equal). There's even some for comparison semver specifiers! Check out the full list at [if | CMake Documentation](https://cmake.org/cmake/help/latest/command/if.html).