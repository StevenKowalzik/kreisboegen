import g4p_controls.*;


void setup() {
  size(800, 600);
  background(255);
  createGUI();
  frameRate(3);
}

void draw() {
  background(255);
  int radius = 1;
  noFill();
  stroke(0);
  while(radius < size_control.getValueI()) {
    
    float openers[] = {random(-QUARTER_PI,HALF_PI), random(0,HALF_PI), random(0,HALF_PI)};
    int chooser = int(random(0,2)); // chooser and openers for the arcs, making them vary in size
    float side = random(0,1); // choose whether it'll apear left or right
    println(side);
    int randomradius = int(random(2,6)); 
    radius += randomradius; // making the radius of the arcs bigger every time
    
    stroke(0,0,0,stroke_control.getValueI()); // stroke alpha changeable through a slider
    if(checkbox1.isSelected()){ //random color checkbox
      fill(random(255),random(255),random(255),opacity_control.getValueI());
    }
    else{
      fill(color_r.getValueI(),color_g.getValueI(),color_b.getValueI(),opacity_control.getValueI()); //fill color set through the sliders, seems to be CMYK not RGB
    } 
      if(side >= 0.5) {
        if(draw_circle.isSelected()) { // draw circle Checkbox
          ellipse(width/2+radius,height/2, radius*2, radius*2); 
        }
        else if (draw_arcs.isSelected()) { // draw arcs Checkbox
          arc(width/2+radius, height/2, radius*2, radius*2, HALF_PI-openers[chooser], PI+HALF_PI+openers[chooser]);
        }
        else {}   
      }
      else{
        if(draw_circle.isSelected()) {
          ellipse(width/2-radius,height/2, radius*2, radius*2);
        }  
        else if (draw_arcs.isSelected()) {
          arc(width/2-radius, height/2, radius*2, radius*2, PI+HALF_PI-openers[chooser], 2*PI+HALF_PI+openers[chooser]);
        }
        else {}  
    }  
  }
}
