cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

project(
    "GodotExtension" 
    VERSION 0.1.0 
    LANGUAGES CXX
)

# Prevention from building in the source directory
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds not allowed. Please make a build directory and run CMake from there.\n")
endif()

# ===========================
# Project options
# ===========================
include(cmake/sources.cmake)
include(cmake/settings.cmake)
include(cmake/package-managers.cmake)
include(cmake/doxygen.cmake)
include(cmake/compiler.cmake)
include(cmake/utils.cmake)
include(cmake/sanitizers.cmake)

# Set the compiler standard to C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC_VERSION GREATER_EQUAL "1900" AND CMAKE_VERSION LESS 3.10)
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag("/std:c++17" _cpp_latest_flag_supported)
    if(_cpp_latest_flag_supported)
        add_compile_options("/std:c++17")
    endif()
endif()


# ===========================
# adding exec/lib
# ===========================
add_library(${PROJECT_NAME} SHARED ${HEADERS} ${SOURCES})

message(STATUS "Found the following sources:")
foreach(SOURCE IN LISTS SOURCES)
    message(STATUS "* ${SOURCE}")
endforeach()

message(STATUS "Found the following headers:")
foreach(HEADER IN LISTS HEADERS)
    message(STATUS "* ${HEADER}")
endforeach()

# ===========================
# Project standard and warnings
# ===========================
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
set_project_warnings(${PROJECT_NAME})
message(STATUS "Applied compiler warnings. Using standard C++${CMAKE_CXX_STANDARD}.\n")

# ===========================
# Project dependencies
# ===========================
CPMAddPackage("gh:godotengine/godot-cpp#godot-4.0-stable")
target_link_libraries(${PROJECT_NAME} PUBLIC godot::cpp)

# For Windows, it is necessary to link with the MultiThreaded library.
# On Linux and Mac this variable is ignored. 
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")

message(STATUS "Successfully added all dependencies and linked against them.\n")

# ===========================
# Set the build/user include directories
# ===========================
target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)
message(STATUS "Finished setting up include directories.\n")

# ===========================
# Format the project using the `clang-format` target 
# ===========================
if(ENABLE_CLANG_FORMAT)
    add_clang_format_target()
endif()