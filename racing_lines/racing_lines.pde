import controlP5.*;
ControlP5 cp5;
float slider_curve = 0;
float slider_speed = 15;
float slider_noise = 0;
int slider_players = 1;
int sliders_num = 0;

void setup(){
  size(1300, 800);
  
  //background(0, 0, 0);
  cp5 = new ControlP5(this);
  place_slider("slider_curve", "Curvature", 90);
  place_slider("slider_speed", "Speed", 100);
  place_slider("slider_noise", "Noise", 100);
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
  background(235, 240, 255);
  //strokeWeight(10);
  //line(0, height/2, width, height/2);
}

void place_slider(String name, String label, float range){
    int size = 25;
    cp5.addSlider(name)
      .setSize(size, 100)
      .setPosition(size - 10 + 80 * sliders_num, height - 130)    
      .setRange(0, range)
      .setValueLabel(label)
      
      .setColorBackground(color(0, 0, 0))
      .setColorForeground(color(115, 180, 255))
      .setColorActive(color(0, 255, 50))
      .setColorValueLabel(color(0, 0, 0))
      .setColorCaptionLabel(color(0, 0, 0))
      .setSliderMode(Slider.FLEXIBLE)
      //.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_INSIDE).setPaddingX(-30)
      ;
     sliders_num += 1;
}
