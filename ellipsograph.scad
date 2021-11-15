use <pd-gears/pd-gears.scad>

module rounded_square(siz = 80, rad = 10){
    translate((siz/2 - rad) * [-1, -1])
        minkowski(){
            square(siz-2*rad);
            circle(rad);
        }
}

//rounded_square();
inner_teeth_number = 31;

difference() {
    rounded_square(120);
    projection() gear(mm_per_tooth = 5, number_of_teeth = inner_teeth_number * 2 , hole_diameter = 0, pressure_angle = 20);
};

difference() {
    projection() gear(mm_per_tooth = 5, number_of_teeth = inner_teeth_number, hole_diameter = 0, pressure_angle = 20);
    for(i = [0 : 20]) {
        translate(1.25 *i * [sin(i*360/inner_teeth_number * 3), cos(i*360/inner_teeth_number * 3)])
            circle(1/2, $fn = 50);
    }
};
