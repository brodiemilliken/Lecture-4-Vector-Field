int rows,cols;
int scale = 10;
float zOff = 0;
float inc = 0.05;
float timeInc = 0.005;

void setup(){
  size(600,600);
  rows = height/scale + 1;
  cols = width/scale + 1;
}

void draw(){
  background(255);
  float xOff = 0;
  for (int x = 0; x < cols; x++){
    float yOff = 0;
    for (int y = 0; y < rows; y++){
      PVector v = PVector.fromAngle(noise(xOff,yOff,zOff)*TWO_PI*2);
      push();
      translate(x*scale,y*scale);
      rotate(v.heading());
      line(0,0,scale,0);
      pop();
      yOff += inc;
    }
    xOff += inc;
  }
  zOff += timeInc;
}
