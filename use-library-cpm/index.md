# Using {fmt} via CPM.cmake

<<< ./CMakeLists.txt{7-12,13,16,4 cmake}

<<< ./main.cpp{8}

```sh
cmake -B build
cmake --build build
./build/my-app
#=> Hello Alan Turing!
```

<details><summary>Install CPM.cmake</summary>

> ```sh
> mkdir -p cmake
> wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake
> ```

&mdash; [CPM.cmake](https://github.com/cpm-cmake/CPM.cmake)

</details>