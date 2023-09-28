cmake_minimum_required(VERSION 3.20)
project(my-project)

set(CMAKE_CXX_STANDARD 17)

include(FetchContent)
FetchContent_Declare(
  cpr
  GIT_REPOSITORY https://github.com/libcpr/cpr.git
  # https://github.com/libcpr/cpr/releases
  GIT_TAG 1.10.4
)
FetchContent_MakeAvailable(cpr)

add_executable(my-app main.cpp)
target_link_libraries(my-app PRIVATE cpr::cpr)
