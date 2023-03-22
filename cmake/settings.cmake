

# Doxygen
option(ENABLE_DOXYGEN       "Enable Doxygen documentation builds of source."  OFF)

# Clang-Tidy and Clang-Format
option(ENABLE_CLANG_TIDY    "Enable static analysis with Clang-Tidy."         OFF)
option(ENABLE_CLANG_FORMAT  "Enable code foramtting with Clang-Format."       OFF)

# Compiler options
option(WARNINGS_AS_ERRORS   "Treat compiler warnings as errors."              OFF)

# Package managers options(Conan, Vcpkg, CPM)
option(ENABLE_CONAN         "Enable the Conan package manager."               OFF)
option(ENABLE_VCPKG         "Enable the Vcpkg package manager."               OFF)
option(ENABLE_CPM           "Enable the CPM   package manager."               ON)

# Sanitizers options
set(USE_SANITIZER "" CACHE STRING "Address, Memory, MemoryWithOrigins, Undefined, Thread, Leak, CFI")

# Generate compile_commands.json for clang based tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Export all symbols when building a shared library
if(BUILD_SHARED_LIBS)
  set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS OFF)
  set(CMAKE_CXX_VISIBILITY_PRESET hidden)
  set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)
endif()
