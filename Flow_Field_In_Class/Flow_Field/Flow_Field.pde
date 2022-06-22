float inc = 0.1;
int scl = 10;
int rows, cols;
float zOff = 0;
PVector[][] flowfield;

Particle[] particles;
int numberOfParticles = 5000;

void setup(){
  colorMode(HSB);
  fullScreen(P2D);
  cols = floor(width/scl) + 1;
  rows = floor(height/scl) + 1;
  flowfield = new PVector[cols][rows];
  particles = new Particle[numberOfParticles];
  for (int i = 0; i < numberOfParticles; i++)
  {
    particles[i] = new Particle();
  }
  background(0);

  
}

void draw(){
  strokeWeight(2);
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  float yOff = 0;
  for (int y = 0; y < rows; y++){
    float xOff = 0;
    for (int x = 0; x < cols; x++){
     float r = noise(xOff, yOff, zOff) * TWO_PI * 2;
     PVector v = PVector.fromAngle(r);
     flowfield[x][y] = v;
     
     xOff += inc;
     /*
     stroke(255,100);
     push();
     translate(x*scl,y*scl);
     rotate(v.heading());
     line(0,0,scl,0);     
     pop();
     */
     
    }
    yOff += inc;
  }
  zOff += 0.01;
  
  for (int i = 0; i < numberOfParticles; i++)
  {
    particles[i].show();
    particles[i].follow(flowfield);
    particles[i].update();
    particles[i].edges();
  }

}
