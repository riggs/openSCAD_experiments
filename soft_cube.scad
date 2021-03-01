module soft_cube(size, radius, center=false, $fn=$fn) {
    function o(s) = center ? s / 2 : 0;
    if (is_num(size)) {
        r = is_undef(radius) ? size / 16 : radius;
        zero = r - o(size);
        i = size - r - o(size);
        hull() {
            // As tempting as a for loop might be here, it causes like 100x performance degredation.
            translate([zero, zero, zero])
            sphere(r, $fn=$fn);
            translate([zero, i, zero])
            sphere(r, $fn=$fn);
            translate([i, i, zero])
            sphere(r, $fn=$fn);
            translate([i, zero, zero])
            sphere(r, $fn=$fn);
            translate([zero, zero, i])
            sphere(r, $fn=$fn);
            translate([zero, i, i])
            sphere(r, $fn=$fn);
            translate([i, i, i])
            sphere(r, $fn=$fn);
            translate([i, zero, i])
            sphere(r, $fn=$fn);
        }
    } else if (is_list(size) && len(size) == 3) {
        r = is_undef(radius) ? (size.x + size.y + size.z) / (3 * 16) : radius;
        zx = r - o(size.x);
        zy = r - o(size.y);
        zz = r - o(size.z);
        ix = size.x - r - o(size.x);
        iy = size.y - r - o(size.y);
        iz = size.z - r - o(size.z);
        hull () {
            // As tempting as a for loop might be here, it causes like 100x performance degredation.
            translate([zx, zy, zz])
            sphere(r, $fn=$fn);
            translate([zx, iy, zz])
            sphere(r, $fn=$fn);
            translate([ix, iy, zz])
            sphere(r, $fn=$fn);
            translate([ix, zy, zz])
            sphere(r, $fn=$fn);
            translate([zx, zy, iz])
            sphere(r, $fn=$fn);
            translate([zx, iy, iz])
            sphere(r, $fn=$fn);
            translate([ix, iy, iz])
            sphere(r, $fn=$fn);
            translate([ix, zy, iz])
            sphere(r, $fn=$fn);
        }
    } else assert(!is_undef(size_t), "Invalid argument");   
}

module test_soft_cube() {
    Q = 64;
    #soft_cube(10, 1, fn=Q);
    soft_cube(1, .1, center=true, fn=Q);
    %soft_cube([3, 4, 5], .5, fn=Q);
}