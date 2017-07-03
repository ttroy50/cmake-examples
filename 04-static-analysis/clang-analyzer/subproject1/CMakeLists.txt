# Set the project name
project (subproject1)

# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    main1.cpp
)

# Add an executable with the above sources
add_executable(${PROJECT_NAME} ${SOURCES})
