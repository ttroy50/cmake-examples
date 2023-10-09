cmake_minimum_required(VERSION 3.0)
project(myproject)

message("Hello world!")
if(WIN32)
  message("Hello Windows!")
elseif(UNIX)
  message("Hello Unix!")
endif()

add_custom_target(
  mymessage ALL COMMAND ${CMAKE_COMMAND} -E echo "Hello build!"
)