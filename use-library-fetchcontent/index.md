# Using a library via `FetchContent`

<sup>ℹ This example uses [cpr C++ Requests: Curl for People](https://docs.libcpr.org/) as the demo library.</sup>

<<< ./CMakeLists.txt{4-10 cmake}

<<< ./main.cpp

```sh
cmake -B build
cmake --build build
./build/my-app
```

Expect this to take some time to build! It has to build cpr, which includes
building curl from source. Fun fact: curl has 150,000+ lines of C code! 😱

## What is `FetchContent`?

<sup>**Introduced in CMake v3.11**</sup>

**TL;DR:** It's like `wget` for CMake-based C/C++ Git repositories.

`FetchContent` allows you to include external projects directly within your
CMake project, making it easier to handle dependencies without requiring users
to download and build them separately or rely on system-level package managers.
It simplifies the process of bringing in external code into your project by
automatically handling tasks like downloading, building, and configuring those
dependencies.

Here's how `FetchContent` works and what it does:

1. **Downloading external dependencies:** When you use `FetchContent` in your
   CMake project, you specify the external dependency you want to include and
   provide a source URL (such as a Git repository URL). When you configure or
   build your CMake project, CMake will automatically download the specified
   external dependency from the provided source URL. This is especially useful
   when your project depends on libraries hosted on Git repositories, for
   example.

2. **Integration into your project:** Once the external dependency is
   downloaded, `FetchContent` integrates it into your CMake project as if it
   were part of your project's source code. This means you can use the
   dependency's header files, source code, and build artifacts directly as if
   they were part of your project.

3. **Building external dependencies:** `FetchContent` can also automatically
   build the downloaded dependency as part of your CMake project's build
   process. This ensures that the external library is compiled and linked
   correctly with your project.

4. **Configuring external dependencies:** Many CMake-based projects require
   certain configuration options to be set when building external dependencies.
   `FetchContent` allows you to pass these configuration options to the external
   project during the integration process.

5. **Customization:** `FetchContent` provides flexibility for customization. You
   can specify where the external dependency should be downloaded and built, set
   custom options for the integration, and control the build process of the
   dependency.

Here's a basic example of how you might use `FetchContent` in a CMake project:

```cmake
include(FetchContent)

FetchContent_Declare(
    my_dependency
    GIT_REPOSITORY https://github.com/example/my_dependency.git
    GIT_TAG v1.0.0
)

FetchContent_MakeAvailable(my_dependency)

# Now you can use the components of 'my_dependency' in your project
```

In this example, `FetchContent_Declare` specifies the external dependency to
download from a Git repository, and `FetchContent_MakeAvailable` integrates it
into your project. After that, you can use the components of `my_dependency` in
your CMake project as if they were part of it.
