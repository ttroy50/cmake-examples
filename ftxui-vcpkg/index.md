# Using FTXUI via Vcpkg

::: code-group

<<< ./CMakeLists.txt{4,6 cmake}

<<< ./CMakePresets.json

:::

<<< ./vcpkg.json

<<< ./main.cpp{cpp}

```sh
vcpkg install
cmake --preset my-preset
cmake --build build
./build/myui
```

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
