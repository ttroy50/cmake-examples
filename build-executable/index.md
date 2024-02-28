# Build an executable

The status quo "Hello world!" project for C and C++ looks something like this:

<<< ./main.c

```sh
cc main.c -o my-app
./my-app
#=> Hello world!
```

Instead of running `cc main.c -o app`, a "Hello world!" CMake project is a bit more involved:

<<< ./main.c

<<< ./CMakeLists.txt{cmake}

```sh
cmake -B build
cmake --build build
./build/my-app
```

`cmake_minimum_required()` will error early if the CMake version is too outdated. This helps prevent weird "not found" error messages that are hard to debug from popping up 5 minutes into a long compilation process. `project()` defines a project name for this particular collection of CMake scripts & targets. One project can have multiple libraries and binaries. `add_executable()` tells CMake to create an executable using the C/C++ compiler with the given files as inputs. In this example that's just `main.c` but it could include more `.c` files or additional `.a` static libraries or `.o` object files.

The `cmake -B build` command tells CMake to generate the actual native C/C++ toolchain build scripts and other resources (for Visual Studio, Ninja, Make, or others) into the `build/` folder. That's what the `-B` flag does. If you just run `cmake` it will clutter your current directory with lots of generated toolchain files. The `cmake --build build` command tells CMake to execute the native toolchain (that's the `--build` flag) from the `build/` folder. `--build` is a distinct and different flag from `-B`.

### What is a target?

> Probably the most important item is targets. Targets represent executables, libraries, and utilities built by CMake. Every `add_library`, `add_executable`, and `add_custom_target` command creates a target. For example, the following command will create a target named "foo" that is a static library, with `foo1.c` and `foo2.c` as source files.
>
> ```cmake
> add_library(foo STATIC foo1.c foo2.c)
> ```

&mdash; [Key Concepts | CMake](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Key%20Concepts.html#:~:text=Targets%20represent%20executables%2C%20libraries%2C%20and,c%20and%20foo2.)
