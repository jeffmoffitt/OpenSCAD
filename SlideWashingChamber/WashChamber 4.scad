// Wash Chamber V4
// Jeffery Moffitt
// jeffmoffitt@gmail.com
// December 22, 2015//Modified January 26, 2016//Modified February 11, 2016//Modified February 26, 2016

module catch() {
    cube(size=([9,3,3]));
    translate([3,0,-3])cube(size=([3,3,3]));
}
//catch();

module case() {
    difference(){
        translate([0,0,0])cube(size=([49, 59, 50])); //Outside box 99
        translate([3,3,3])cube(size=([43, 53, 48])); // Inside 93
    }
    //Add ribs
    for (pos=[3:5:54]){
        union(){
            translate([0, pos, 0])cube(size=([7,3,43]));
            translate([42, pos, 0])cube(size=([7,3,43]));
        }
    }
   //Add lid holder and symmetry breaking mark
    translate([49/2-9/2,59,42*3/4-3/2])catch();
    translate([0,59/2-9/2,42*3/4-3/2])rotate([0,0,90])catch();
    translate([52,59/2-9/2,42*3/4-3/2])rotate([0,0,90])catch();
}
//case();

module coverslip(){
    translate([4.5,0,0])rotate([0,90,0])cylinder(h=1, r=20, $fn=500);
}
//coverslip();

module latch(){
    union(){
        cube(size=([2, 1, 42/4 + 3/2 + 5]));
        translate([0,-1, 0])cube(size=([2, 1, 1.5]));
    }
} 
//latch();

module cover(){
    union(){//Add latches
        difference(){ //Create top plate
            cube(size=([42, 52, 2]));
            rotate([0,0,45])translate([-10,-10,-.5])cube(size=([20,20,3]));
        }
        translate([21,26,2])difference(){ //Create handle
            rotate([0,90,0])cylinder(h=3, r=10, $fn=50);
            translate([-1,-10,-20])cube(size=([5,20,20]));
        }
    }  
}
//translate([0,0,45])color("red")cover();

module washcontainer(){
    translate([25, 30, 0])difference(){
        cylinder(h=50,r=42, $fn=500);
        translate([0,0,-1])cylinder(h=52,r=40,$fn=500);
    }
}
//washcontainer();

//case();
//translate([25,2,23])rotate([0,0,90])coverslip();
//washcontainer();
//translate([3.5,3.5,50])color("red")cover();
cover();
