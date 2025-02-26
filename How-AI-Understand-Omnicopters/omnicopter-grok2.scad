// Basic Omnicopter Frame and Motor Mounts

// Parameters
frame_width = 100; // Size of the central frame
motor_placement_radius = 50; // Radius from center to where motors are placed
motor_size = 10; // Size of the motor representations
motor_height = 5; // Height of motor (simplified)
motor_count = 8; // Number of motors (typical for omnicopters)

// Central Frame
cube([frame_width, frame_width, 5], center = true);

// Motor Mounts
for (i = [0 : motor_count-1]) {
    angle = i * 360 / motor_count; // Evenly distribute motors around the circle
    
    // Position the motors
    translate([
        cos(angle) * motor_placement_radius,
        sin(angle) * motor_placement_radius,
        0
    ])
    {
        // Motor base - a simple cylinder for representation
        cylinder(h = motor_height, r = motor_size/2, center = true);
        
        // Motor arm - extending outwards
        rotate([0, 0, angle])
        translate([motor_size/2, 0, 0])
        cube([motor_placement_radius, 1, 1], center = true);
    }
}