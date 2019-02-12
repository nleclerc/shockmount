
ring_width = 4;
bar_width = 4;

inner_radius = 29.5;
nick_depth = 1;
square_translation = inner_radius-bar_width/2+nick_depth;

rubber_radius = 1.5;
rubber_spacing = 20;


linear_extrude(ring_width) {
    difference() {
        circle(inner_radius+ring_width);
        circle(inner_radius);
        
        translate([0,square_translation,0])
        square(bar_width,true);

        translate([0,-square_translation,0])
        square(bar_width,true);

        translate([square_translation,0,0])
        square(bar_width,true);

        translate([-square_translation,0,0])
        square(bar_width,true);
    }
}

linear_extrude(bar_width) {
    x_delta = -3*bar_width;
    
    for (i=[0:3]) {
        translate([x_delta+i*bar_width*2,0,0]) {
            difference() {
                square([bar_width,30],true);
                
                translate([-ring_width+nick_depth,0,0])
                square(ring_width,true);
                translate([bar_width/3*2,rubber_spacing/2,0])
                circle(rubber_radius);
                translate([bar_width/3*2,-rubber_spacing/2,0])
                circle(rubber_radius);
            }
        }
    }
}
