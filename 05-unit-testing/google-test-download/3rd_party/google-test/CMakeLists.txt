# Download and unpack googletest at configure time
# See: http://crascit.com/2015/07/25/cmake-gtest/
configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)
# Call CMake to download and Google Test
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()
# Build the downloaded google test
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
endif()

# Prevent overriding the parent project's compiler/linker
# settings on Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
# Prevent installation of GTest with your project
set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
set(INSTALL_GMOCK OFF CACHE BOOL "" FORCE)

# Add googletest directly to our build. This defines
# the gtest and gtest_main targets.
add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/googletest-src
                 ${CMAKE_CURRENT_BINARY_DIR}/googletest-build)

# This is a bit of a hack that can be used to get gtest libraries to build in C++11 if you aren't using CMAKE_CXX_STANDARD
#
#set(CXX11_FEATURES
#    cxx_nullptr
#    cxx_auto_type
#    cxx_delegating_constructors
#)
#target_compile_features(gtest
#    PRIVATE
#        ${CXX11_FEATURES}
#)
#
#target_compile_features(gmock_main
#    PRIVATE
#        ${CXX11_FEATURES}
#)
#
#target_compile_features(gmock
#    PRIVATE
#        ${CXX11_FEATURES}
#)
#
#target_compile_features(gmock_main
#    PRIVATE
#        ${CXX11_FEATURES}
#)

# Add aliases for GTest and GMock libraries
if(NOT TARGET GTest::GTest)
    add_library(GTest::GTest ALIAS gtest)
    add_library(GTest::Main ALIAS gtest_main)
endif()

if(NOT TARGET GTest::GMock)
    add_library(GMock::GMock ALIAS gmock)
    add_library(GMock::Main ALIAS gmock_main)
endif()

