# Using GTest via Conan

<<< ./CMakeLists.txt{3,4,8-10 cmake}

<<< ./conanfile.txt{toml}

::: code-group

<<< ./test/greet_test.cpp [test/greet_test.cpp]

<<< ./src/greet.h{cpp} [src/greet.h]

<<< ./src/greet.cpp [src/greet.cpp]

<<< ./src/main.cpp [src/main.cpp]

:::

```sh
conan install . -s build_type=Debug
cmake --preset conan-debug
cmake --build --preset conan-debug
./build/hi
ctest --preset conan-debug
```

<details><summary>How to install Conan</summary>

```sh
pip install conan
```

</details>

[📚 Learn more about Conan](https://docs.conan.io/en/latest/getting_started.html)
