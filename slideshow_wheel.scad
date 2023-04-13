$fn=50;

window_x=4;
window_y=5;
window_distance_from_center=8;
diameter=30;
windows=8;
thickness=3;
tolerance=0.4;
ridges=50;
ridge_size=2;
bump_diameter=3;
bump_depth=-1; //from top face, bump is centered
bump_position=12; // from center
nub_height=1;
nub_diameter=2;

difference() {
  
  cylinder(d=diameter+ridge_size*2+tolerance,h=thickness);

  //windows
  for(i=[0:windows])
    rotate([0,0,(360/windows)*i]) 
      translate([window_distance_from_center,-window_y/2,0])  
        cube([window_x,window_y,thickness]);

  // cutout
  translate([0,0,tolerance]) 
    cylinder(d=diameter-tolerance,h=thickness);
  
  //ridges 
  for(i=[0:ridges])
    rotate([0,0,(360/ridges)*i]) 
      translate([diameter/2+ridge_size/2+tolerance,0,0]) 
        #cube([ridge_size,ridge_size/2,thickness]);
  
  // nub female for stacking
  cylinder(h=nub_height, d=nub_diameter+tolerance); 
}


translate([diameter+10,0,0]) {
  
  difference() {
    
    union() {
      cylinder(d=diameter-tolerance*2,h=thickness-tolerance*2);
      // nub male
    translate([0,0,thickness-tolerance*2]) 
      cylinder(h=nub_height, d=nub_diameter); 
      
    }
    //windows
    for(i=[0:windows])
      rotate([0,0,(360/windows)*i]) 
        translate([window_distance_from_center,-window_y/2,0])  
          cube([window_x,window_y,thickness]);
    
    // bumps
    for(i=[0:windows])
      rotate([0,0,(360/windows)*i+(180/windows)])
        translate([bump_position,0,thickness-tolerance*2-bump_depth])
          #sphere(d=bump_diameter, $fn=10);
    // nub hole for stacking
    cylinder(h=nub_height, d=nub_diameter+tolerance); 
  }
}




