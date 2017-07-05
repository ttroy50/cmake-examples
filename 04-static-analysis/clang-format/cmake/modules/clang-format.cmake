# A CMake script to find all source files and setup clang-format targets for them

# Find all source files
file(GLOB_RECURSE ALL_SOURCE_FILES *.cpp *.h *.cxx *.hxx *.hpp *.cc)

# Don't include some common build folders
set(CLANG_FORMAT_EXCLUDE_PATTERNS ${CLANG_FORMAT_EXCLUDE_PATTERNS} "main2.cpp" "build/" "/CMakeFiles/")

# get all project files file
foreach (SOURCE_FILE ${ALL_SOURCE_FILES}) 
    foreach (EXCLUDE_PATTERN ${CLANG_FORMAT_EXCLUDE_PATTERNS})
        string(FIND ${SOURCE_FILE} ${EXCLUDE_PATTERN} EXCLUDE_FOUND) 
        if (NOT ${EXCLUDE_FOUND} EQUAL -1) 
            list(REMOVE_ITEM ALL_SOURCE_FILES ${SOURCE_FILE})
        endif () 
    endforeach ()
endforeach ()

add_custom_target(format
    COMMENT "Running clang-format to change files"
    COMMAND ${CLANG_FORMAT_BIN}
    -style=file
    -i
    ${ALL_SOURCE_FILES}
)

add_custom_target(format-check
    COMMENT "Checking clang-format changes"
    COMMAND ${CLANG_FORMAT_BIN}
    -style=file
    -output-replacements-xml
    ${ALL_SOURCE_FILES}
    | grep "replacement offset" 2>&1 > /dev/null
)

# This is a hack because our CMake root dir isn't the same as our git root dir

# Get the path to this file
get_filename_component(_clangcheckpath ${CMAKE_CURRENT_LIST_FILE} PATH)
# call the script to chech changed files in git
add_custom_target(format-check-changed
    COMMENT "Checking changed files in git"
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMAND ${_clangcheckpath}/../scripts/clang-format-check-changed ${CLANG_FORMAT_BIN}
)

