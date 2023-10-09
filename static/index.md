# Build a static library

We can use the `add_library()` function to define a `STATIC` library (`.a` or
`.lib`) or a `SHARED` library (`.so` or `.dll`). Check out the [build a shared
library] example for the `SHARED` counterpart.

<<< ./CMakeLists.txt{3 cmake}

<<< ./mylib.c

```sh
cmake -B build
cmake --build build
ls build
```

<iframe frameborder="0" style="width: 100%; height: 500px" src="https://replit.com/@jcbhmr/cmakebyexampledev-static?embed=1"></iframe>

[build a shared library]: /shared/
