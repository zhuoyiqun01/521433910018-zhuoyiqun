//利用ascII码将"a"到"z"的出现顺序与频率可视化
String[] txt;
ArrayList<Ball> balls;
float posx=0;
float posy=0;
float s=20;
float x0=600;
float y0=300;
char c;
int pc;
int count;
float x=width/2, y=height/2, r=20;
boolean flag=false;
float ballWidth = 48;
PVector start;
PVector end;
int ac=0;

particle [] p=new particle[26];

void setup() {
  frameRate(50);
  size(1200, 600);
  balls = new ArrayList<Ball>();
  txt=loadStrings("bob.txt");
  background(190, 255, 130);
  //textFont(font1);
  textSize(60);
  noStroke();
  fill(0);
  float angle=0;
  float Dangle=2*PI/26;
  for (int i=0; i<p.length; i++) {
    p[i]=new particle(x0+cos(angle)*200, y0+sin(angle)*200, 97+i);
    angle+=Dangle;
  }
}
void draw() {
  fill(190, 255, 130, 20);
  rect(0, 0, width, height);

  for (int i=0; i<p.length; i++) {
    p[i].display();
  }

  count=0;
  pc=int( txt[1].charAt(1))-97;
  int a=0;

  for (int i=0; i < txt.length; i++) {
    for (int j=0; j < txt[i].length(); j++) {
      count+=1;
      //textSize(s);
      c= txt[i].charAt(j);
      if (frameCount==count) {
        noStroke();
        drawshape(posx, (i+1)*s, s, c);
        stroke(p[pc].c);
        fill(255);
        text(c, posx, (i+1)*s);
        strokeWeight(3);
        if (int(c)>=97) {
          line (p[pc].x, p[pc].y, p[int(c)-97].x, p[int(c)-97].y);
        }
        if (int(c)>=65 && int(c)<=90) {
          line (p[pc].x, p[pc].y, p[int(c)-65].x, p[int(c)-65].y);
        }
        p[pc].r+=4;
        a++;
      }
      noStroke();

      if (int(c)>=97) {
        pc=int(c)-97;
      }
      if (int(c)>=65 && int(c)<=90) {
        pc=int(c)-65;
      }

      noStroke();

      posx +=textWidth(c);
    }
    posx=0;
  }
  if (a==0) {
    
    if(flag==false)remake();
    background(190, 255, 130);
    for (int i = balls.size()-1; i >= 0; i--) {
      Ball ball = balls.get(i);
      ball.move();
      ball.display();
      ball.collision();
      ball.edge();
      if (ball.finished()) {
        balls.remove(i);
      }
    }
    if (mousePressed==true) {
      end=new PVector(mouseX, mouseY);
      if (ballWidth<150)ballWidth=dist(start.x, start.y, end.x, end.y);
      else ballWidth=150;
      stroke(255);
      strokeWeight(2);
      noFill();
      ellipse(start.x, start.y, ballWidth*2, ballWidth*2);
    }
  }
}

void mousePressed() {

  start=new PVector(mouseX, mouseY);
}
void mouseReleased() {
  balls.add(new Ball(start.x, start.y, ballWidth*2));
  ballWidth=10;
}
void drawshape(float xx, float yy, float ss, char cc) {
  float cx;
  // noStroke();
  cx=textWidth(cc);
  if (int(cc)>96) {
    fill(255, 255-(int(cc)-97)*10);
  }
  if (int(cc)<96) {
    fill(255, 255-(int(cc)-97)*10);
  }
  if (int(cc)==32) {
    noFill();
    cx=textWidth(" ");
    posx +=cx;
  }
  rectMode(CORNER);
  rect(xx, yy, cx, ss);
}

void remake(){
  frameRate(40);
  for(int i=0;i<p.length;i++){
    balls.add(new Ball(p[i].x,p[i].y ,p[i].r));
  }
  flag=true;
}
void keyPressed(){
if(key=='['&&ac>-40)ac-=10;
if(key==']'&&ac<200)ac+=10;
 frameRate(40+ac);
}
