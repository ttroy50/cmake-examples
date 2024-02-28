# Using a library via Vcpkg

<<< ./CMakeLists.txt{4,6 cmake}

<<< ./main.cpp{cpp}

::: code-group

<<< ./vcpkg.json

<<< ./CMakePresets.json

:::

```sh
vcpkg install
cmake --preset my-preset
cmake --build build
./build/my-app
```

## What is Vcpkg?

> Vcpkg helps you manage C and C++ libraries on Windows, Linux and MacOS. This tool and ecosystem are constantly evolving, and we always appreciate contributions!

&mdash; [microsoft/vcpkg](https://github.com/microsoft/vcpkg)

Here's a quick installation guide:

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
cd "$Env:USERPROFILE"
git clone "https://github.com/microsoft/vcpkg.git"
cd vcpkg
./bootstrap-vcpkg.bat
# TODO: Add VCPKG_ROOT to env
# TODO: Add VCPKG_ROOT to PATH
```

:::

[📚 Learn more about Vcpkg](https://learn.microsoft.com/vcpkg)
