import controlP5.*;
ControlP5 cp5;
int sliders_height = 150;
float slider_curve = 0;
float slider_speed = 5;
float slider_vert_accel = 0;
float slider_noise = 0;
int slider_players = 1;
int ui_elements = 0;
int slider_separator = 80;

int[] pathX = new int[50];
int[] pathY = new int[50];

int posX = 0;
int posY = 10;
float vert_speed = 0;

void setup(){
  size(1300, 800);
  
  //background(0, 0, 0);
  cp5 = new ControlP5(this);
  
  place_slider("slider_speed", "Speed", 10);
  place_slider("slider_vert_accel", "Vertical Accel",-1, 1);
  place_slider("slider_curve", "Curvature", 90);
  place_slider("slider_noise", "Noise", 1);
  place_slider("slider_players", "Player num", 10);
  
  //cp5.addSlider("slider_height")
  //    .setSize(10, 100)
  //    .setPosition(20, height - 130)
  //    .setRange(0, height)
  //    .setColorBackground(color(0, 0, 0))
  //    .setColorForeground(color(255, 130, 255))
  //    .setColorActive(color(130, 255, 140))
  //    .setColorValueLabel(color(0, 0, 0))
  //    .setColorCaptionLabel(color(0, 0, 0))
  //    ;
}

void draw(){
  background(0, 0, 0);
  
  noStroke();
  fill(color(235, 240, 255));
  rect(0, height - sliders_height - 40, slider_separator * ui_elements + 20, height);
  
  racer();
  
}
void racer(){
  vert_speed += slider_vert_accel;
  
  if (posX > width){
      posX = 0;
      posY = 10;
      vert_speed = 0;
  }
  else{
      posX += slider_speed;
      posY += -vert_speed;
  }
  
  if (vert_speed > 10){
      vert_speed = 10;
  }
  if (vert_speed < -10){
      vert_speed = -10;
  }
  if (posY > height){
      posY = height - 1;
      vert_speed = 0;
  }
  if (posY < 5){
      posY = 5;
      vert_speed = 0;
  }
  

  
  fill(color(255, 0, 0));
  for (int i = 0; i < pathX.length; i++){
    
    stroke(color(255, 0, 0));
    strokeWeight(2);
    point(pathX[i], pathY[i]);
    if (i!=0){
        pathX[i-1] = pathX[i];
        pathY[i-1] = pathY[i];
    }
  }
  if (pathX.length-1 >= 0){
      pathX[pathX.length-1] = posX;
      pathY[pathY.length-1] = posY;
  }
  stroke(color(255, 255, 0));
  strokeWeight(5);
  point(posX, posY);
}

void place_slider(String name, String label, float max_range){
  // overload with 1 range parameter
  float min_range = 0;
  place_slider(name, label, min_range, max_range);
}
void place_slider(String name, String label, float min_range, float max_range){
    
    cp5.addSlider(name)
      .setSize(20, sliders_height)
      .setPosition(20 + slider_separator * ui_elements, height - sliders_height - 20)    
      .setRange(min_range, max_range)
      .setCaptionLabel(label)
      
      .setColorBackground(color(70, 80, 70))
      .setColorForeground(color(115, 180, 255))
      .setColorActive(color(0, 255, 50))
      .setColorValueLabel(color(0, 0, 0))
      .setColorCaptionLabel(color(0, 0, 0))
      
      //.setSliderMode(Slider.FLEXIBLE)
      //.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_INSIDE).setPaddingX(-30)
      ;
     ui_elements += 1;
}
