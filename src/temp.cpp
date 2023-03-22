#include <temp.h>
#include <godot_cpp/core/class_db.hpp>

using namespace godot;

void Temp::_bind_methods() {
}

Temp::Temp() {
    // initialize any variables here
    time_passed = 0.0;
}

Temp::~Temp() {
    // add your cleanup here
}

void Temp::_process(float delta) {
    time_passed += delta;

    Vector2 new_position = Vector2(10.0 + (10.0 * sin(time_passed * 2.0)), 10.0 + (10.0 * cos(time_passed * 1.5)));

    set_position(new_position);
}