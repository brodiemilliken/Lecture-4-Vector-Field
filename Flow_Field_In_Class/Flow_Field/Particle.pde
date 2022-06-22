class Particle{
  PVector pos, vel, acc, prePos;
  float topSpeed = 5;
  color col = color(random(255),255,255);
  public Particle(){
    this.pos = new PVector(random(width),random(height));
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.prePos = this.pos.copy();
  }
  
  void update(){
   this.vel.add(this.acc);
   this.pos.add(this.vel);
   this.acc.set(0,0);
  }
  
  void follow(PVector[][] vectors){
   int x = floor(this.pos.x / scl);
   int y = floor(this.pos.y / scl);
   PVector force = vectors[x][y];
   this.applyForce(force);
  }
  
  void applyForce(PVector force){
   this.acc.add(force); 
   this.vel.setMag(topSpeed);
  }
  
  void show(){
   stroke(col,100);
   line(this.pos.x,this.pos.y,this.prePos.x,this.prePos.y);
   this.updatePre();
  }
  
  void edges(){
   if (this.pos.x > width) {
     this.pos.x = 0; 
     updatePre();
   }
   if (this.pos.x < 0) {
     this.pos.x = width; 
     updatePre();
   }
   if (this.pos.y > height) {
     this.pos.y = 0; 
     updatePre();
   }
   if (this.pos.y < 0) {
     this.pos.y = height; 
     updatePre();
   }
  }
  
  void updatePre(){
     this.prePos.x = this.pos.x;
     this.prePos.y = this.pos.y;
  }
  
  
  
}
  
