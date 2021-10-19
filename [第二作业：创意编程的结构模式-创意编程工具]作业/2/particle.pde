class particle{

  float x;
  float y;
  float x0;
  float y0;
  float r;
  float r0;
  float xspeed;
  float yspeed;
  float angle;
  
  particle(){
  x=random(width);
  y=random(height);
 
  r=random(20,50);
  angle=random(90);
  x0=width/2-x;
  y0=height/2-y;
  }
void drawparticle(color c){
if(abs(x0)>0.05){
  fill(c);
noStroke();
pushMatrix();
translate(x,y);

rotate(angle);
rect(x0,y0,r0,r0);
x0+=-x0/10;
y0+=-y0/10;
r0+=(r-r0)/10;
popMatrix();}


}
void draw(){}
  
  
  
  
  
  











}
