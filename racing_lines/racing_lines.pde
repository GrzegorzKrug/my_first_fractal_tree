import controlP5.*;
ControlP5 cp5;
int sliders_height = 150;
float slider_smooth_flat = 0.1;
float slider_speed = 3;
float slider_vert_accel = 0;
float slider_noise = 0;
float slider_amplitude = 0.1;
float slider_freq = 0.5;


int slider_players = 1;
int ui_elements = 0;
int slider_separator = 80;

int bottom_limit;

Racer agent1, agent2, agent3, agent4, agent5,
      agent6, agent7, agent8, agent9, agent10;
Racer[] agents = new Racer[100];

void setup(){
  size(1300, 800);
  bottom_limit = height - sliders_height - 40 - 1;
  init_hud();
  new_game();
}

void init_hud()
{
  cp5 = new ControlP5(this);  
  place_slider("slider_speed", "Speed", 10);
  place_slider("slider_vert_accel", "Vertical Accel",-1, 1);
  place_slider("slider_smooth_flat", "Y Smoothness", 0, 1);
  place_slider("slider_noise", "Noise", 1);
  place_slider("slider_players", "Player num", 10);
  place_slider("slider_amplitude", "Sin Amplitude", 0, 3);
  place_slider("slider_freq", "Sin Frequency", 0.15, 1);
  //place_slider("slider_freq", "Sin Frequency", 0.15, 1);
}

void new_game(){
  for(int i=0; i<10; i++)
  {
    agents[i] = new Racer();
  }
  //agent1 = new Racer();
  //agent2 = new Racer();
  //agent3 = new Racer();
  //agent4 = new Racer();
  //agent5 = new Racer();
  //agent6 = new Racer();
  //agent7 = new Racer();
  //agent8 = new Racer();
  //agent9 = new Racer();
  //agent10 = new Racer();
}


void draw(){
  background(0, 0, 0);
  
  noStroke();
  fill(color(235, 240, 255));
  rect(0, height - sliders_height - 40, slider_separator * ui_elements + 20, height);
  
  for(int i=0; i<10; i++)
  {
    agents[i].move();
  }
  //agent1.move();
  //agent2.move();
  //agent3.move();
  //agent4.move();
  //agent5.move();
  //agent6.move();
  //agent7.move();
  //agent8.move();
  //agent9.move();
  //agent10.move();
  
}
class Racer{
    int y_start = (int) random(1, 550);
    float random_noise = random(-2, 2);
    int trail_len = (int) random(50, 150);
    float[] pathX = new float[trail_len];
    float[] pathY = new float[trail_len];
    int[] my_color = new int[]{(int) random(255), (int) random(255), (int) random(255)};
    float posX = 0;
    float posY = y_start;
    float vert_speed = 0;
    float smooth_edge = 0.01;
    
    //my_color[] = [random(255), random(255), random(255)];
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
            vert_speed = vert_speed *  (1 - slider_smooth_flat); 
            
            if (abs(vert_speed) > smooth_edge){
                if(vert_speed>0){
                    vert_speed -= smooth_edge/2 * smooth_edge;  
                }
                else{
                    vert_speed += smooth_edge/2 * smooth_edge;
                }
            
                posY += vert_speed;
            }
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
        
        fill(my_color[0], my_color[1], my_color[2]);
        for (int i = 0; i < pathX.length; i++){
          
          float multiplier = ((float)i/pathX.length) + 0.1;  // I and pathX are ints

          stroke(color(my_color[0] * multiplier, my_color[1]*multiplier, my_color[2]*multiplier));          
          strokeWeight(2);
          point(pathX[i], pathY[i]);
          
          if (i!=0){
              pathX[i-1] = pathX[i];  // move older points to end of array
              pathY[i-1] = pathY[i];  // move older points to end of array
          }
        }
        if (pathX.length-1 >= 0){
            pathX[pathX.length-1] = posX;
            pathY[pathY.length-1] = posY;
        }
        stroke(my_color[0], my_color[1], my_color[2]);
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
