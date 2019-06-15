float angle = PI / 4;
//HScrollbar hs1, hs2;  // Two scrollbars
// ControlP5

void setup() {
  size(500, 500);
  //slider1 = new HScrollbar(0, height/2-8, width, 16, 16);
}


void draw() {
  background(51);  
  stroke(255);
  translate(width/2, height);
  branch(100);
 
}

void branch(float len){
  if (len > 1) {
 line(0, 0, 0, -len);
 translate(0, -len);
 rotate(angle);
 
 branch(len - 15);
  }
}
