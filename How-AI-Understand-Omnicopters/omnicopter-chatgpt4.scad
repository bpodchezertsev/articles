/*
Draw a model of an omnicopter in OpenScad

Sure! Below is an OpenSCAD model of an omnicopter—a theoretical drone that can move in any direction without changing orientation. This model features a central body with multiple rotors mounted at different angles.
Features of the Model:

    A central cylindrical body as the main structure.
    Six rotors, each mounted at an angle, to allow movement in all directions.
    Arms extending from the body to hold the motors.

OpenSCAD Code:
openscad
*/
// Omnicopter Model in OpenSCAD

$fn = 100; // Smoothness for circles

// Main Body
module body() {
    cylinder(h=20, r=25, center=true);
}

// Rotor (propeller + motor)
module rotor() {
    // Motor base
    translate([0, 0, 2])
        cylinder(h=4, r=5, center=true);

    // Propeller Blades
    for (a=[0, 120, 240]) {
        rotate([0, 0, a])
            translate([0, 10, 4])
                cube([2, 20, 1], center=true);
    }
}

// Arm holding the rotor
module arm(angle) {
    rotate([0, 0, angle])
    translate([0, 30, 0])
    rotate([30, 0, 0]) {
        // Arm structure
        translate([0, -15, 0])
            cube([4, 30, 4], center=true);

        // Rotor at the end of the arm
        translate([0, 15, 4])
            rotor();
    }
}

// Complete Omnicopter Assembly
module omnicopter() {
    body();

    // Six arms at different angles for omnidirectional movement
    for (angle=[0, 60, 120, 180, 240, 300]) {
        arm(angle);
    }
}

// Render the omnicopter
omnicopter();
/*
How This Works:

    The main body is a simple cylinder.
    Rotors are placed at six positions, each mounted at an angle to simulate omnidirectional thrust.
    The arms extend outward and tilt slightly, which is typical for omnicopters to achieve full control in all directions.

How to Use:

    Copy and paste the code into OpenSCAD.
    Click F5 to preview or F6 to render fully.
    You can export the model as STL if you want to 3D print it!

This model provides a simple representation of an omnicopter, but you can modify it further by adjusting angles, adding landing gear, or refining the rotor design. 🚁

*/