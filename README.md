# Godot CMake Template

### About
This project is a template to create GDExtension plugins using Cmake instead of Scons.  

### Acknowledgements 
Godot official tutorial:
* https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/gdextension_cpp_example.html

This guys tutorial:
* https://thatonegamedev.com/cpp/godot-4-gdextension-for-c-using-cmake/

# Getting Started 
1. Change project's name inside CMakeLists.txt and rename GodotExtension.cmake.in to match new project's name
2. Change game's name inside game/project.godot 
3. Add new files to include/ and src
4. Add those files to cmake/sources.cmake
5. Register new classes by adding them to src/register_types.cpp