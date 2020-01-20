# Locate cppcheck
#
# This module defines
#  CPPCHECK_FOUND, if false, do not try to link to cppcheck --- if (CPPCHECK_FOUND)
#  CPPCHECK_BIN, where to find cppcheck
#
# Exported argumets include
#   CPPCHECK_THREADS
#   CPPCHECK_ARG
#
# find the cppcheck binary
find_program(CPPCHECK_BIN NAMES cppcheck)

#
# Arguments are 
# -j use multiple threads (and thread count)
# --quite only show errors / warnings etc
# --error-exitcode The code to exit with if an error shows up
# --enabled  Comma separated list of the check types. Can include warning,performance,style
# Note nightly build on earth changes error-exitcode to 0
set (CPPCHECK_THREADS "-j 4" CACHE STRING "The -j argument to have cppcheck use multiple threads / cores")

set (CPPCHECK_ARG "${CPPCHECK_THREADS}" CACHE STRING "The arguments to pass to cppcheck. If set will overwrite CPPCHECK_THREADS")

# handle the QUIETLY and REQUIRED arguments and set YAMLCPP_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
    CPPCHECK 
    DEFAULT_MSG 
    CPPCHECK_BIN
    CPPCHECK_THREADS
    CPPCHECK_ARG)

mark_as_advanced(
    CPPCHECK_BIN  
    CPPCHECK_THREADS
    CPPCHECK_ARG)
