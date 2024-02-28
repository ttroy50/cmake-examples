# Build multiple targets

<<< ./CMakeLists.txt{3-6 cmake}

::: code-group

<<< ./hello-world.c

<<< ./goodbye-world.cpp

<<< ./greet.c

:::

```sh
cmake -B build
cmake --build build

# It built four things! 🎉
./build/hello-world
./build/goodbye-world
file ./build/greet.a
file ./build/greet.so
```
