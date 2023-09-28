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

[cpp-actions/setup-cmake]: https://github.com/cpp-actions/setup-cmake
