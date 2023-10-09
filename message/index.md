# Print a message

Sometimes you just want to print a message. This can be useful for debugging or
notifying the user of a status. Another good use case is printing out a
help-like menu of available `-DMYOPTION=myvalue` flags if your CMake compilation
is complex.

The `message()` function prints the given message at _generation-time_
(`cmake -B build`). If you want to print a message at _build-time_, you need to
add a custom build target. The `ALL` argument in the example tags the target
(`mymessage`) so that when you run `cmake --build build` with no specific
`--target mytarget` it will include the `mymessage` target.

Check out the [custom shell target example] for more details on how the `add_custom_target()` `COMMAND` magic works.

<<< ./CMakeLists.txt{4,6,8,11-13 cmake}

```sh
cmake -B build
cmake --build build
```

<iframe frameborder="0" style="width: 100%; height: 500px" src="https://replit.com/@jcbhmr/cmakebyexampledev-message?embed=1"></iframe>

<!-- prettier-ignore -->
📚 Further reading: [message() | CMake](https://cmake.org/cmake/help/latest/command/message.html)

[custom shell target example]: /shell-target/