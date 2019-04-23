cmake_minimum_required(VERSION 3.13)
project(sinus_kurve)

set(CMAKE_CXX_STANDARD 14)

add_executable(sinus_kurve main.cpp)

find_package(OpenCV REQUIRED COMPONENTS calib3d imgproc core imgcodecs highgui)
if (OpenCV_FOUND)
  include_directories(${OpenCV_INCLUDE_DIRS})
else ()
  message(FATAL_ERROR "Could not find OpenCV!")
endif ()


target_link_libraries(sinus_kurve
  ${OpenCV_LIBRARIES})
