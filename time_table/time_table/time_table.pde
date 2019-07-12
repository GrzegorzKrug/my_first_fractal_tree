import controlP5.*;
ControlP5 cp5;

int dots_slider = 339;  // Slider 
float next_line_multiply = 85.85;  // Slider
boolean toggle_cont = false;

int next_number;  // For drawing on clock
int N = 10;  // Dots
float radius = 450;

int[][] all_points;

Slider abc;

void setup(){
  println(dots_slider);
  noSmooth();
  size(1300, 950);
  cp5 = new ControlP5(this);  

  cp5.addSlider("dots_slider")
    .setPosition(10, 10)
    .setRange(10, 1500)
    //.setValue(55)
    .setSize(20, 700)    
    .setCaptionLabel("Dots")
    ;
    
  cp5.addSlider("next_line_multiply")
    .setPosition(60, 10)
    //.setValue(25)
    .setSize(20, 700)
    .setRange(0, 100)
    .setCaptionLabel("MultiPlication")
    ;
    
  cp5.addButton("Button_Draw")
     .setPosition(200,5)
     .setSize(200,19)
     .setCaptionLabel("Draw now!")
     ;
  cp5.addToggle("toggle_cont")
     .setPosition(200,35)
     .setSize(200,19)
     .setCaptionLabel("Continues Draw.")
     ;

  draw_stuff();
}

//void redraw(){
//  println("Redraw!!");
//  background(0, 0, 0);
//  stroke(color(235, 240, 255));
//  //point(x, y);   
//}

void draw(){
  noStroke();
  fill(0);
  rect(0,0, 150, height);
  if (toggle_cont == true){
    draw_stuff();
  }
}

void draw_stuff(){  
  background(0, 0, 0);
  stroke(color(255,0,0));  
  strokeWeight(6);    
  point(width/2, height/2);
  
  set_points();
  for(int i=0; i<N; i++){
    stroke(color(30, 255, 120));
    strokeWeight(5);
    point(all_points[0][i],all_points[1][i]);
    next_number = (int)round(next_line_multiply * (i + 1))%N;
    stroke(255);
    stroke(i%240 + 10);
    strokeWeight(1);
    line(all_points[0][i],all_points[1][i],all_points[0][next_number],all_points[1][next_number]);
  }  
}
void Button_Draw() {    
  draw_stuff();
}

//void dots_slider(){
//  draw_stuff();
//}

void set_points(){
  //println("Setting points", dots_slider);
  N = dots_slider;
  all_points = new int[2][N];
  float angle_step = 360 / (float)N;
  float x = 0;
  float y = 0;
  
  for(int i=0;i<N;i++){        
         x = -round(sin(radians(i * angle_step)) * radius) + width/2;
         y = -round(cos(radians(i * angle_step)) * radius) + height/2;         
         all_points[0][i] = (int)round(x);
         all_points[1][i] = (int)round(y);
  }

}
