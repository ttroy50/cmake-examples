project(subbinary)

set(SOURCES
    main.cpp
)

# Create the executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Link the static library from subproject1 using it's alias sub::lib1
# Link the header only library from subproject2 using it's alias sub::lib2
target_link_libraries(${PROJECT_NAME}
    sub::lib1
    sub::lib2
)

# Include the inc directories from the sub projects
include_directories( ${PROJECT_NAME}
    PRIVATE
    ${sublibrary1_SOURCE_DIR}/inc
    ${sublibrary2_SOURCE_DIR}/inc
)
