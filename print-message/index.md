# Print a message

Sometimes you just want to print a message. This can be useful for debugging or notifying the user of a status. Another good use case is printing out a help-like menu of available `-DMYOPTION=myvalue` flags if your CMake compilation is complex.

The `message()` function prints the given message at _generation-time_ (`cmake -B build`). If you want to print a message at _build-time_ (`cmake --build build`), you probably want something like [`#pragma message()`](https://learn.microsoft.com/en-us/cpp/preprocessor/message), [`#warning`](https://en.cppreference.com/w/cpp/preprocessor/error), or [`#error`](https://en.cppreference.com/w/cpp/preprocessor/error).

⚠️ This example will not generate successfully or compile sucessfully due to the `message(FATAL_ERROR)` and `#error` errors respectively.

<<< ./main.c{1,2,3}

<<< ./CMakeLists.txt{4,5,6 cmake}

```sh
# 🛑 These fail given the 👆 example code
cmake -B build
cmake --build build
./build/my-app
```

There are other enum-like values that can be used in the `message()` function:

```
(none)         = Important information
STATUS         = Incidental information
WARNING        = CMake Warning, continue processing
AUTHOR_WARNING = CMake Warning (dev), continue processing
SEND_ERROR     = CMake Error, continue processing,
                              but skip generation
FATAL_ERROR    = CMake Error, stop processing and generation
DEPRECATION    = CMake Deprecation Error or Warning if variable
                 CMAKE_ERROR_DEPRECATED or CMAKE_WARN_DEPRECATED
                 is enabled, respectively, else no message.
```

📚 Further reading: [message | CMake](https://cmake.org/cmake/help/latest/command/message.html)

[custom shell target example]: /shell-target/