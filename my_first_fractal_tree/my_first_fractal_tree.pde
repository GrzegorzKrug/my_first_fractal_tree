import controlP5.*;
ControlP5 cp5;

float angle = PI / 4;

int myColor = color(0,100,255);
int depth_slider = 13;
float lenslider = .30;
float len_factor = 0.74;
float angle_noise = 0.05;
float angleslider = 0.65;

//Slider abc;

void setup() {
  size(1000, 1000);
  //slider1 = new HScrollbar(0, height/2-8, width, 16, 16);
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("angleslider")
    .setPosition(100, 50)
    .setSize(150,15)
    .setRange(-PI/4, PI/4)
    
    ;
    
 cp5.addSlider("angle_noise")
   .setPosition(100,70)
   .setSize(150, 15)
   .setRange(-PI/4, PI/4)
   .setNumberOfTickMarks(31)
   ;
 
 cp5.addSlider("depth_slider")
     .setPosition(10, 180)
     .setSize(20, 100)
     .setRange(0, 15)
     .setCaptionLabel("Max Branches depth")
 ;
 
 cp5.addSlider("len_factor")
     .setPosition(50, 160)
     .setSize(20, 100)
     .setRange(0.1, 0.85)
     .setCaptionLabel("Next branch scale")
     ;
     
 cp5.addSlider("lenslider")
     .setPosition(90, 140)
     .setSize(20, 100)
     .setRange(.01, 2)    
     .setCaptionLabel("Next branch length cut")
     //.setNumberOfTickMarks(20)
     //.setSliderMode(Slider.FLEXIBLE)
     ;    


 
}

void draw() {

  
  background(51);  
  stroke(255);
  
  push();
  translate(width/2, height);
  branch(150, 0);

  pop();
 
}

void branch(float len, int depth){

 line(0, 0, 0, -len);
 translate(0, -len);
 if ((len > 3) & (depth < depth_slider)) {
 //long myseed;
 //long seed;
 //seed = Long.parseLong(string(len));
 //seed = (long) len;
 randomSeed((long)len);  
 
 push();
 rotate(angleslider + random(-1, 2) * angle_noise); 
 branch(len * len_factor -  lenslider, depth + 1);
 pop();
 rotate(-angleslider + random(-1, 2) * angle_noise); 
 branch(len * len_factor - lenslider, depth + 1);
  }
}
