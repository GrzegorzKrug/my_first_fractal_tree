import controlP5.*;
ControlP5 cp5;
int sliders_height = 150;
float slider_curve = 0;
float slider_speed = 3;
float slider_vert_accel = 0;
float slider_noise = 0;
float slider_amplitude = 1;
float slider_freq = 0.5;

int slider_players = 1;
int ui_elements = 0;
int slider_separator = 80;

int bottom_limit;

Racer agent1, agent2, agent3, agent4, agent5,
      agent6, agent7, agent8, agent9, agent10;


void setup(){
  size(1300, 800);
  bottom_limit = height - sliders_height - 40 - 1;
  
  cp5 = new ControlP5(this);  
  place_slider("slider_speed", "Speed", 10);
  place_slider("slider_vert_accel", "Vertical Accel",-1, 1);
  place_slider("slider_curve", "Curvature", 90);
  place_slider("slider_noise", "Noise", 1);
  place_slider("slider_players", "Player num", 10);
  place_slider("slider_amplitude", "Sin Amplitude", 0, 3);
  place_slider("slider_freq", "Sin Frequency", 0.15, 1);
  
  agent1 = new Racer();
  agent2 = new Racer();
  agent3 = new Racer();
  agent4 = new Racer();
  agent5 = new Racer();
  agent6 = new Racer();
  agent7 = new Racer();
  agent8 = new Racer();
  agent9 = new Racer();
  agent10 = new Racer();
}

void draw(){
  background(0, 0, 0);
  
  noStroke();
  fill(color(235, 240, 255));
  rect(0, height - sliders_height - 40, slider_separator * ui_elements + 20, height);
  
  agent1.move();
  agent2.move();
  agent3.move();
  agent4.move();
  agent5.move();
  agent6.move();
  agent7.move();
  agent8.move();
  agent9.move();
  agent10.move();
  
}
class Racer{
    int y_start = (int) random(1, 550);
    float random_noise = random(-2, 2);
    int trail_len = (int) random(10, 80);
    float[] pathX = new float[trail_len];
    float[] pathY = new float[trail_len];
    
    float posX = 0;
    float posY = y_start;
    float vert_speed = 0;
    
    void move(){
        //vert_speed += slider_vert_accel;
        //vert_speed += sin(posX / 180 * PI / 90) * 50 * 1;
        
        if (posX > width){
            posX = 0;
            posY = y_start;
            //vert_speed = 0;
        }
        else{
            posX += slider_speed;
            //posY += -vert_speed;
            float angle = 0;
            angle = ((float)posX)* PI / 180; 
            vert_speed += sin(angle * slider_freq) * slider_amplitude;
            posY += vert_speed;
        }
        
        if (vert_speed > 5){
            vert_speed = 5;
        }
        if (vert_speed < -5){
            vert_speed = -5;
        }
        if (posY > bottom_limit){
            posY = 1;
            //vert_speed = 0;
        }
        if (posY < 1){
            posY = bottom_limit;
            //vert_speed = 0;
        }
        
        fill(color(255, 0, 0));
        for (int i = 0; i < pathX.length; i++){
          
          stroke(color(i * 255 / pathX.length + 30, 0, 0));
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
};

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
