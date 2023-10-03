# Build outside your source tree

::: code-group

```sh [Option A]
cmake -B build
cmake --build build # or 'make -C build' directly
```

```sh [Option B]
cd build
cmake ..
cmake --build . # or 'make' directly
```

:::
