# Build a shared library

Instead of [a static library], now we are using the `SHARED` argument to build a
`.so` or `.dll` target.

<<< ./CMakeLists.txt{3 cmake}

<<< ./mylib.c

```sh
cmake -B build
cmake --build build
ls build
```

<iframe frameborder="0" style="width: 100%; height: 500px" src="https://replit.com/@jcbhmr/cmakebyexampledev-shared?embed=1"></iframe>

[a static library]: /static/
