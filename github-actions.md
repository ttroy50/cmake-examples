# CMake in GitHub Actions

Guess what? CMake is already installed by default on `ubuntu-*`, `macos-*`, and
`windows-*` runners! You can use it to build your project without installing
anything.

```yml{8,9}
on: push
jobs:
  cmake-build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      # Look mom! No 'uses: cpp-actions/setup-cmake@v1'! // [!code focus]
      - run: cmake -B build // [!code focus]
      - run: cmake --build build // [!code focus]
```

If, however, you need a specific version of CMake (like the latest cutting edge
version or a specific older version) you can use an action like
[cpp-actions/setup-cmake].

Note that Conan, Vcpkg, and any system libraries **are not installed** by
default. You'll still need to manually use [cpp-actions/setup-conan],
[cpp-actions/setup-vcpkg], and `sudo apt install lib...-dev` as needed.

<details open><summary>Example using Conan</summary>

```yml{8}
on: push
jobs:
  cmake-build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      # Need to install Conan first // [!code focus]
      - uses: cpp-actions/setup-conan@v1 // [!code focus]
      - run: conan install . -s build_type=Debug // [!code focus]
      - run: cmake --preset conan-debug // [!code focus]
      - run: cmake --build --preset conan-debug // [!code focus]
```

</details>

<details open><summary>Example using Vcpkg</summary>

```yml{8}
on: push
jobs:
  cmake-build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      # Need to install Vcpkg first // [!code focus]
      - uses: cpp-actions/setup-vcpkg@v1 // [!code focus]
      - run: vcpkg install fmt // [!code focus]
      - run: cmake -B build -DCMAKE_TOOLCHAIN_FILE=vcpkg.cmake // [!code focus]
      - run: cmake --build build // [!code focus]
```

</details>

[cpp-actions/setup-cmake]: https://github.com/cpp-actions/setup-cmake
[cpp-actions/setup-conan]: https://github.com/cpp-actions/setup-conan
[cpp-actions/setup-vcpkg]: https://github.com/cpp-actions/setup-vcpkg
