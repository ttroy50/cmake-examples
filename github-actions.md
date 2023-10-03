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
default. You'll still need to manually run `pip install conan`, use
[cpp-actions/setup-vcpkg], and `sudo apt install lib...-dev` as needed.

```yml
- run: pip install conan
- uses: cpp-actions/setup-vcpkg@v1
- run: sudo apt-get install -y libgit2-dev
```

[cpp-actions/setup-cmake]: https://github.com/cpp-actions/setup-cmake
[cpp-actions/setup-vcpkg]: https://github.com/cpp-actions/setup-vcpkg
