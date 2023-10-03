# Two executable targets

<<< ./CMakeLists.txt{4,5 cmake}

::: code-group

<<< ./a_main.c

<<< ./b_main.cpp

:::

```sh
cmake -B build
cmake --build build
# It builds two executables:
./build/hello-a
./build/hello-b
```
