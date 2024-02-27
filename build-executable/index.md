# Build an executable

The status quo "Hello world!" project for C and C++ looks something like this:

```c
#include <stdio.h>
int main() {
    puts("Hello world!\n");
    return 0;
}
```

```sh
cc main.c -o app
./app
#=> Hello world!
```

Instead of running `cc main.c -o app`, a "Hello world!" CMake project is a bit more involved. You need to create an additional `CMakeLists.txt` file that tells CMake what to do to compile your application. Use the `add_executable()` function to define a `myapp` target that CMake implicitly knows how to build from the given `main.c` file.

<<< ./CMakeLists.txt{cmake}

<<< ./main.c

```sh
cmake -B build
cmake --build build
./build/myapp
```

In `CMakeLists.txt` there is a `cmake_minimum_required()` declaration that is there to help developers by indicating a minimum required CMake version. This is incredibly helpful to avoid more obscure error messages later like "could not find function do_thing_in_modern 

### What is a target?

> Probably the most important item is targets. Targets represent executables,
> libraries, and utilities built by CMake. Every `add_library`,
> `add_executable`, and `add_custom_target` command creates a target. For
> example, the following command will create a target named “foo” that is a
> static library, with `foo1.c` and `foo2.c` as source files.
>
> ```cmake
> add_library(foo STATIC foo1.c foo2.c)
> ```

&mdash; [Key Concepts | CMake](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Key%20Concepts.html#:~:text=Targets%20represent%20executables%2C%20libraries%2C%20and,c%20and%20foo2.)
