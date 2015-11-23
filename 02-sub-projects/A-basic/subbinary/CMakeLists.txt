project(subbinary)

# Include the inc directories from the sub projects
include_directories(
    ${sublibrary1_SOURCE_DIR}/inc
    ${sublibrary2_SOURCE_DIR}/inc
    )

set(SOURCES
    main.cpp
)

# Create the executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Link the static library from subproject1
# This uses the project name to find out the library info
target_link_libraries(${PROJECT_NAME}
    sublibrary1
)
