# Using FTXUI via Vcpkg

<<< ./CMakeLists.txt{4,6 cmake}

<<< ./vcpkg.json

<<< ./main.cpp{cpp}

```sh
vcpkg install
cmake -B build -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake"
cmake --build build
./build/myui
```

💡 Don't want to specify `-DCMAKE_TOOLCHAIN_FILE` every time? Check out [the
`CMakePresets.json` example]!

<details><summary>How to install Vcpkg</summary>

::: code-group

```sh [Linux, macOS]
cd ~
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
echo 'export VCPKG_ROOT="$HOME/vcpkg"' >> ~/.bashrc
echo 'export PATH="$PATH:$VCPKG_ROOT"' >> ~/.bashrc
```

```powershell [Windows]
cd %USERPROFILE%
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.bat
# TODO: Add VCPKG_ROOT to env
# TODO: Add vcpkg to PATH
```

:::

</details>

[📚 Learn more about Vcpkg](https://learn.microsoft.com/vcpkg)

[the `CMakePresets.json` example]: /cmakepresets/
