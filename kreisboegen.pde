import g4p_controls.*;


void setup() {
  size(800, 600);
  background(255);
  //noLoop();
  createGUI();
  frameRate(3);
}

void keyPressed() {
}

void draw() {
  background(255);
  int radius = 1;
  noFill();
  stroke(0);
  while(radius < size_control.getValueI()) {
    
    float openers[] = {random(-QUARTER_PI,HALF_PI), random(0,HALF_PI), random(0,HALF_PI)};
    int chooser = int(random(0,2));
    float side = random(0,1);
    println(side);
    int randomradius = int(random(2,6));
    radius += randomradius; 
    float open1 = random(-QUARTER_PI,HALF_PI);
    float open2 = random(-HALF_PI, QUARTER_PI);
    
    stroke(0,0,0,stroke_control.getValueI());
    if(checkbox1.isSelected()){
      fill(random(255),random(255),random(255),opacity_control.getValueI());
    }
    else{
      fill(color_r.getValueI(),color_g.getValueI(),color_b.getValueI(),opacity_control.getValueI());
    } 
      if(side >= 0.5) {
        if(draw_circle.isSelected()) {
          ellipse(width/2+radius,height/2, radius*2, radius*2); 
        }
        else if (draw_arcs.isSelected()) {
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
