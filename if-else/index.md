# Conditional if/else

Inevitably you'll need to use `if()` condition checks to test if some condition is met. Common pre-defined variables to check include: [`WIN32`], [`UNIX`], [`APPLE`], and [`CYGWIN`].

<<< ./CMakeLists.txt{4,6,8,11-13 cmake}

```sh
cmake -B build
cmake --build build
```

<iframe frameborder="0" style="width: 100%; height: 500px" src="https://replit.com/@jcbhmr/cmakebyexampledev-if-else?embed=1"></iframe>

<!-- prettier-ignore -->
📚 Further reading: [message() | CMake](https://cmake.org/cmake/help/latest/command/message.html)

[`WIN32`]: https://cmake.org/cmake/help/latest/variable/WIN32.html
[`UNIX`]: https://cmake.org/cmake/help/latest/variable/UNIX.html
[`APPLE`]: https://cmake.org/cmake/help/latest/variable/APPLE.html
[`CYGWIN`]: https://cmake.org/cmake/help/latest/variable/CYGWIN.html