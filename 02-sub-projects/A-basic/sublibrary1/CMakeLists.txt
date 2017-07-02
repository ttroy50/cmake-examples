# Set the project name
project (sublibrary1)

# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/sublib1.cpp
)

# Add a library with the above sources
add_library(${PROJECT_NAME} ${SOURCES})
add_library(sub::lib1 ALIAS ${PROJECT_NAME})

target_include_directories( ${PROJECT_NAME}
    PUBLIC ${PROJECT_SOURCE_DIR}/include
)
