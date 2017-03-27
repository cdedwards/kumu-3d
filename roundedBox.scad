// size is a vector [x, y, z], always draws from center!
module roundedBox(size, radius=5, sidesonly=true)
{
	rot = [ [0,0,0], [90,0,90], [90,90,0] ];
   	if (sidesonly)
	{
   		cube(size - [2*radius,0,0], true);
      	cube(size - [0,2*radius,0], true);
      	for (x = [radius-size[0]/2, -radius+size[0]/2],
      	     y = [radius-size[1]/2, -radius+size[1]/2])
		{
      		translate([x,y,0])
				cylinder(r=radius, h=size[2], center=true);
        }
    }
	else
	{
   		cube([size[0], size[1]-radius*2, size[2]-radius*2], 
			 center=true);
		cube([size[0]-radius*2, size[1], size[2]-radius*2],
			 center=true);
        cube([size[0]-radius*2, size[1]-radius*2, size[2]],
			 center=true);

        for (axis = [0:2])
		{
      		for (x = [radius-size[axis]/2, -radius+size[axis]/2],
                 y = [ radius-size[(axis+1)%3]/2, 
					  -radius+size[(axis+1)%3]/2])
			{
         		rotate(rot[axis]) 
				translate([x,y,0]) 
                cylinder(h=size[(axis+2)%3]-2*radius, 
					     r=radius, center=true);
			}
		}
   		for (x = [radius-size[0]/2, -radius+size[0]/2],
           y = [radius-size[1]/2, -radius+size[1]/2],
           z = [radius-size[2]/2, -radius+size[2]/2])
		{
      		translate([x,y,z])
      		sphere(radius);
        }
	}
}
