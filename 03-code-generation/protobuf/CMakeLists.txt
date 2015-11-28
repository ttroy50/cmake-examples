cmake_minimum_required(VERSION 2.8)

# Set the project name
project (protobuf_example)

# find the protobuf compiler and libraries
find_package(Protobuf REQUIRED)

# check if protobuf was found
if(PROTOBUF_FOUND)
    message ("protobuf found")
    include_directories(${PROTOBUF_INCLUDE_DIRS})
    include_directories(${CMAKE_CURRENT_BINARY_DIR})
else()
    message (FATAL_ERROR "Cannot find Protobuf")
endif()

# Generate the .h and .cxx files
PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS AddressBook.proto)

# Print path to generated files
message ("PROTO_SRCS = ${PROTO_SRCS}")
message ("PROTO_HDRS = ${PROTO_HDRS}")

# Add an executable
add_executable(protobuf_example
    main.cpp
    ${PROTO_SRCS}
    ${PROTO_HDRS})

# link the exe against the libraries
target_link_libraries(protobuf_example
    ${PROTOBUF_LIBRARIES})
