
use <bolts.scad>;

module reflect() {
	children();
	mirror([1, 0, 0]) children();
}

module bar() {
	/* translate([0, 0, 15/2])
	cube([240, 26, 15], true); */
	
	translate([240/2, 0, 0])
	rotate([0, -90, 0])
	linear_extrude(height=240)
	polygon(
		points=[
			[0,0],
			[0,26],
			[15,26],
			[15,2],
			[11,0],
		]
	);
}

module bracket() {
	reflect() {
		difference() {
			cube([40, 30, 25]);
			
			translate([30, 15, 0])
			countersunk_screw_hole(3.5, depth=6, inset=30);
		}
	}
}

difference() {
	bracket();
	
	translate([0, 0, 6])
	bar();
}
