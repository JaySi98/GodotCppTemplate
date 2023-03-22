#ifndef GDEXAMPLE_H
#define GDEXAMPLE_H

#include <godot_cpp/classes/sprite2d.hpp>

namespace godot {

class Temp : public Sprite2D {
    GDCLASS(Temp, Sprite2D)

private:
    float time_passed;

protected:
    static void _bind_methods();

public:
    Temp();
    ~Temp();

    void _process(float delta);
};

}

#endif