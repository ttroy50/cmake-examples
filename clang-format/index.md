# Format with clang-format

<<< ./CMakeLists.txt{cmake}

<<< ./main.c

```sh
cmake -B build
cmake --build build --target format
# ✨ Now the code is formatted!
```

```c
#include <stdio.h>
int main() {
    puts("Hello world!");
    return 0;
}
```
