# Test with GoogleTest

<<< ./CMakeLists.txt{cmake}

::: code-group

<<< ./greet.cpp

<<< ./greet.hpp{cpp}

:::

<<< ./greet_test.cpp

```sh
cmake -B build
cmake --build build
(cd build && ctest)
```

https://google.github.io/googletest/