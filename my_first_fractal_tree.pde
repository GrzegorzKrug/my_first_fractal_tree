import controlP5.*;
ControlP5 cp5;

float angle = PI / 4;

int myColor = color(0,100,255);
float angleslider = PI/6;
float lenslider = 100;
float angle_noise = 0;
Slider abc;

void setup() {
  size(800, 500);
  //slider1 = new HScrollbar(0, height/2-8, width, 16, 16);
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("angleslider")
    .setPosition(100, 50)
    .setSize(150,15)
    .setRange(-PI/2, PI/2)
    
    ;
    
 cp5.addSlider("angle_noise")
   .setPosition(100,70)
   .setSize(150, 15)
   .setRange(0, PI/6)
   ;
   
 cp5.addSlider("lenslider")
     .setPosition(100,140)
     .setSize(20,100)
     .setRange(3,50)
     .setNumberOfTickMarks(20)
     //.setSliderMode(Slider.FLEXIBLE)
     ;    

}


void draw() {
  background(51);  
  stroke(255);
  //translate(width/2, height);
  //branch(100);
 
}

void branch(float len){
  if (len > 1) {
 line(0, 0, 0, -len);
 translate(0, -len);
 rotate(angle);
 
 branch(len - 15);
  }
}
