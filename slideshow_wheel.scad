$fn=100;

window_x=4;
window_y=5;
window_distance_from_center=8;
diameter=30;
windows=8;
thickness=3;
tolerance=0.4;
ridges=50;
ridge_size=2;

difference() {
  
  cylinder(d=diameter+ridge_size*2+tolerance,h=thickness);

  //windows
  for(i=[0:windows])
    rotate([0,0,(360/windows)*i]) 
      translate([window_distance_from_center,-window_y/2,0])  
        cube([window_x,window_y,thickness]);
  translate([0,0,tolerance]) 
    cylinder(d=diameter-tolerance,h=thickness);
  //ridges 
  for(i=[0:ridges])
    rotate([0,0,(360/ridges)*i]) 
      translate([diameter/2+ridge_size/2+tolerance,0,0]) 
        #cube([ridge_size,ridge_size/2,thickness]);
}


translate([diameter+10,0,0]) {
  
  difference() {

    cylinder(d=diameter-tolerance*2,h=thickness-tolerance*2);
    
    //windows
    for(i=[0:windows])
      rotate([0,0,(360/windows)*i]) 
        translate([window_distance_from_center,-window_y/2,0])  
          cube([window_x,window_y,thickness]);
  }
}




