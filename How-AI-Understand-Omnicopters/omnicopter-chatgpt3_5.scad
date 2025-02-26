// Omnicopter in OpenSCAD

module rotor(position, angle) {
    translate(position)
    rotate(angle)
    {
        cylinder(h=2, r=10, center=true);
    }
}

module omnicopter() {
    // Central Body
    sphere(r=10);
    
    // Arms
    for (i = [0:5]) {
        angle = i * 60;
        arm_length = 30;
        rotor_position = [arm_length * cos(angle), arm_length * sin(angle), (i % 2) * 10 - 5];
        rotor_angle = [random(15)-7, random(15)-7, angle];
        rotor(rotor_position, rotor_angle);
        
        // Connectors
        hull() {
            sphere(r=2);
            translate(rotor_position) sphere(r=2);
        }
    }
}

omnicopter();