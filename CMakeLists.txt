# Use the code in this section for standalone projects
cmake_minimum_required(VERSION 3.9 FATAL_ERROR)
project(Garfield-tutorial) #precisa ser o mesmo nome do diretório
if(NOT TARGET Garfield::Garfield)
  find_package(Garfield REQUIRED)
endif()

# ---Build executable------------------------------------------------------------
add_executable(viewfield viewfield.cc)
target_link_libraries(viewfield Garfield::Garfield)


