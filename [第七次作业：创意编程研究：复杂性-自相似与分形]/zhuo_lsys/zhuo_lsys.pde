int i=1;
float n=0.87;
float wind;
LSystem lsys;
void setup() {
  size(800, 800);
  lsys=new LSystem();
  lsys.reset();
}
void draw() {
  stroke(190, 255, 130);
  if(abs(wind)<7){wind=radians(noise(map(frameCount, 0, 1000, 2,4 ))*5-3+map(mouseX, 0, width, -1,1 ));}
  background(0);
  translate(width/2, height);
  lsys.theta=radians(25);
  lsys.render();
}
void mousePressed() {
  if (i<8) {
    i++ ;
    lsys.simulate(i);
  }
}
