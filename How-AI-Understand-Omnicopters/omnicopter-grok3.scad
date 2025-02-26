// Omnicopter Model in OpenSCAD
// Date: February 20, 2025

// Parameters (all dimensions in mm)
frame_radius = 50;       // Radius of the central frame
arm_length = 100;        // Length of each arm to motor
motor_diameter = 20;     // Diameter of motor mount
motor_height = 10;       // Height of motor mount
prop_diameter = 40;      // Diameter of propeller (visual placeholder)
frame_thickness = 5;     // Thickness of the frame and arms

// Central frame (hexagonal base for simplicity)
module central_frame() {
    cylinder(h = frame_thickness, r = frame_radius, center = true, $fn = 6);
}

// Motor mount module
module motor_mount() {
    difference() {
        cylinder(h = motor_height, r = motor_diameter / 2, $fn = 50);
        translate([0, 0, -1])
            cylinder(h = motor_height + 2, r = motor_diameter / 4, $fn = 50); // Hollow center
    }
}

// Propeller placeholder (simplified as a thin disc)
module propeller() {
    color("gray")
        cylinder(h = 1, r = prop_diameter / 2, $fn = 50);
}

// Arm module connecting frame to motor
module arm(angle_x, angle_y, angle_z) {
    rotate([angle_x, angle_y, angle_z])
        translate([0, 0, arm_length / 2])
            cube([frame_thickness, frame_thickness, arm_length], center = true);
}

// Assemble the omnicopter
module omnicopter() {
    // Central frame
    central_frame();

    // Six arms and motors in a tetrahedral-like arrangement
    // Angles approximate omnidirectional thrust coverage
    for (i = [
        [0, 0, 0],          // Top motor
        [180, 0, 0],        // Bottom motor
        [45, 45, 0],        // Front-right
        [45, -45, 0],       // Front-left
        [-45, 45, 120],     // Rear-right
        [-45, -45, -120]    // Rear-left
    ]) {
        // Arm
        rotate([0, 0, i[2]]) // Rotate around Z for azimuthal placement
            arm(i[0], i[1], 0);
        
        // Motor and propeller at the end of each arm
        rotate([0, 0, i[2]])
            translate([0, 0, arm_length])
                rotate([i[0], i[1], 0]) {
                    motor_mount();
                    translate([0, 0, motor_height + 1])
                        propeller();
                }
    }
}

// Render the model
omnicopter();