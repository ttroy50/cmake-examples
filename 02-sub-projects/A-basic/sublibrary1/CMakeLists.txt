# Set the project name
project (sublibrary1)

include_directories(
    ${PROJECT_SOURCE_DIR}/inc
    )

# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/sublib1.cpp
)

# Add a library with the above sources
add_library(${PROJECT_NAME} ${SOURCES})
