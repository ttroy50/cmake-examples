# Using a library via CPM.cmake

<<< ./CMakeLists.txt{4,7 cmake}

<<< ./main.cpp{8}

```sh
cmake -B build
cmake --build build
./build/my-app
#=> Hello Alan Turing!
```

## What is CPM.cmake?

> CPM.cmake is a cross-platform CMake script that adds dependency management capabilities to CMake. It's built as a thin wrapper around CMake's FetchContent module that adds version control, caching, a simple API and more.

&mdash; [CPM.cmake | GitHub](https://github.com/cpm-cmake/CPM.cmake)

Quick installation instructions:

```sh
mkdir -p cmake
wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake
```

```cmake
include(cmake/CPM.cmake)
CPMAddPackage(...)
```

> -   **Small and reusable projects** CPM takes care of all project dependencies, allowing developers to focus on creating small, well-tested libraries.
> -   **Cross-Platform** CPM adds projects directly at the configure stage and is compatible with all CMake toolchains and generators.
> -   **Reproducible builds** By versioning dependencies via git commits or tags it is ensured that a project will always be buildable.
> -   **Recursive dependencies** Ensures that no dependency is added twice and all are added in the minimum required version.
> -   **Plug-and-play** No need to install anything. Just add the script to your project and you're good to go.
> -   **No packaging required** Simply add all external sources as a dependency.
> -   **Simple source distribution** CPM makes including projects with source files and dependencies easy, reducing the need for monolithic header files or git submodules.

&mdash; [CPM.cmake | GitHub](https://github.com/cpm-cmake/CPM.cmake)
