cmake_minimum_required(VERSION 3.6)

project( DisplayImage )
find_package( OpenCV REQUIRED )
set(OpenCV_DIR /home/grisha/Рабочий стол/НГУ/Бакалавриат/2 курс/ЭВМ/lab5/build)
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( DisplayImage main.cpp )
target_link_libraries( DisplayImage ${OpenCV_LIBS} )
target_compile_options(${PROJECT_NAME} PRIVATE
  -Wall -Wextra -Wpedantic
)