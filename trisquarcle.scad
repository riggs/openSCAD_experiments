Q = 128;

include <soft_cube.scad>;

module trisquarcle(size) {
    intersection() {
        translate([size/2,size/2,0])
        linear_extrude(size, center=false, $fn=Q)
        circle(size/2, $fn=Q);
        
        rotate([90,0,0])
        translate([0, 0, -size])
        linear_extrude(size, center=false, $fn=Q)
        translate([size/2, size/2, 0])
        rotate([0, 0, 45])
        square(size/sqrt(2), center=true);
        
        rotate([0,-90,0])
        translate([0, 0, -size])
        linear_extrude(size, center=false, $fn=Q)
        polygon([[0,0],[size,0],[size/2, size]]);
    }
}

module inverse_trisquarcle(size, show_trisquarcle=true) {
    s=size*2/3;
    difference() {
        soft_cube(size, center=false, $fn=Q/2);
        
        translate([size/2, size/2, 0])
        linear_extrude(size, center=false, $fn=Q)
        circle(s/2, $fn=Q);
        
        rotate([90,0,0])
        translate([s/4,s/4,-size])
        linear_extrude(size, center=false, $fn=Q)
        translate([s/2, s/2, 0])
        rotate([0, 0, 45])
        square(s/sqrt(2), center=true);
        
        rotate([0,-90,0])
        translate([s/4,s/4,-size])
        linear_extrude(size, center=false, $fn=Q)
        polygon([[0,0],[s,0],[s/2,s]]);
    }
    
    if (show_trisquarcle) {
        ss=1 - pow(2, -20);
        scale([ss, ss, ss])
        translate([s/4, s/4, s/4])
        trisquarcle(s);
    }
}

inverse_trisquarcle(60);