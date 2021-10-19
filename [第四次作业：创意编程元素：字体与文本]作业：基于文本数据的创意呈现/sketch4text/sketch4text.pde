//利用ascII码将"a"到"z"的出现顺序与频率可视化
String[] txt;
//PFont font1= createFont("Arial",60);
float posx=0;
float posy=0;
float s=20;
float x0=600;
float y0=300;
char c;
int pc;
int count;
float x=width/2, y=height/2, r=20;

particle [] p=new particle[26];
void setup() {
  frameRate(30);
  size(1200, 600);
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
  rect(0, 0, width, height);//刷新背景

  for (int i=0; i<p.length; i++) {
    p[i].drawparticle();
  }//初始化

  count=0;
  pc=int( txt[1].charAt(1))-97;


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
        text(c, posx,(i+1)*s);
        strokeWeight(3);
        if (int(c)>=97) {
          line (p[pc].x, p[pc].y, p[int(c)-97].x, p[int(c)-97].y);
        }
        if (int(c)>=65 && int(c)<=90) {
          line (p[pc].x, p[pc].y, p[int(c)-65].x, p[int(c)-65].y);
        }
        p[pc].r+=4;
         
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
