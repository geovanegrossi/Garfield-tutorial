# Use the code in this section for standalone projects
cmake_minimum_required(VERSION 3.9 FATAL_ERROR)
project(gem)
if(NOT TARGET Garfield::Garfield)
  find_package(Garfield REQUIRED)
endif()

# ---Build executable------------------------------------------------------------
add_executable(completeavalanche completeavalanche.cc)
target_link_libraries(completeavalanche Garfield::Garfield)

add_executable(viewfield viewfield.cc)
target_link_libraries(viewfield Garfield::Garfield)

