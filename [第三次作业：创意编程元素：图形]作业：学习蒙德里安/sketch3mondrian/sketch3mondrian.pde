 //<>//
//1.约定最小间隔min并将间隔为min的若干点作为取样点
//2.随机（概率1）行列产生贯穿线条作为一级框架
//3.随机（概率2）框架线（包括左与上边缘）上的取样点相连（仅水平竖直），产生下一级框架——重复n次这一过程
//4.随机取样点使用"填充"功能,鼠标位置控制重色块
//5.鼠标单击重制一级框架，人为选择构图平衡的帧作为作品

int min=15;//最小间隔
int a=600;//画幅
boolean[] x=new boolean[a/min];
boolean[] y=new boolean[a/min];
ppoint[] p=new ppoint[(a/min)*(a/min)];//1.约定最小间隔min并将间隔为min的若干点作为取样点(取不到下和右边界)
float d;//这是一个骰子
float d1=15;//鼠标控制概率1（越上越复杂）
float d2=400;//鼠标控制概率2(越左越复杂)
int n=3;//键盘控制结构复杂度1～4（越大越复杂）


void setup() {
  //初始化
  size(600, 600);
  frameRate(2);
  background(255);

  //随机行列产生横竖长线条
  for (int i=1; i<x.length; i++) {
    d=random(d1);
    if (d<1) {
      x[i]=true;
    } else {
      x[i]=false;
    }
  }

  for (int i=1; i<y.length; i++) {
    d=random(d1);
    if (d<1) {
      y[i]=true;
    } else {
      y[i]=false;
    }
  }
}

void draw() {
  background(255);
  step2();//2.随机行列产生贯穿线条作为框架
  for (int i=0; i<n; i++) {
    step3();
  }//3.随机框架线（包括边缘）上的取样点相连（仅水平竖直），产生下一级框架——重复n次这一过程
  step4();//4.随机（或固定）取样点使用"填充"功能
  step5();//5.加个白框
}

void step2() {

  noFill();
  stroke(0);
  strokeWeight(6);
  for (int i=1; i<x.length; i++) {
    if ( x[i]==true) {
      line(i*min, 0, i*min, height);
    }
  }
  for (int i=1; i<y.length; i++) {
    if (y[i]==true) {
      line(0, i*min, width, i*min);
    }
  }
}
void step3() {
  reload();
  for (int i=0; i<p.length; i++) {
    p[i].shakehands();
  }
}

void step4() {
  fill0(int(random(a)/min), int(random(a)/min), 180);
  fill0(int(random(a)/min), int(random(a)/min), 230);
  fill0(int(random(a)/min), int(random(a)/min), 230);
  fill0(int(mouseX/min), int(mouseY/min), 80);
}
void step5() {
  noFill();
  stroke(255);
  strokeWeight(7);
  rect(0, 0, a, a);
}
void reload() {
  //刷新p[]和pixel[]
  loadPixels();
  for (int j = 0; j < a/min; j ++) {
    for (int i =0; i < a/min; i ++) {
      p[j*a/min+i] = new ppoint(i, j);
    }
  }
}

void fill0(int x, int y, color c) {
  int x1=x;
  int x2=x;
  int x3=x;
  int y1=y;
  int y2=y;
  int y3=y;
  if (pixels[y2*min*width+x*min]!=-16777216) {
    while (pixels[y2*min*width+x*min]!=-16777216&&y2<height/min-1) {
      y2+=1;
    }
    while (pixels[y*min*width+x2*min]!=-16777216&&x2<width/min-1) {
      x2+=1;
    }
    while (pixels[y1*min*width+x*min]!=-16777216&&y1>0) {
      y1-=1;
    }
    while (pixels[y*min*width+x1*min]!=-16777216&&x1>0) {
      x1-=1;
    }
    fill(c);
    strokeWeight(6);
    stroke(0);
    rect(x1*min, y1*min, (x2-x1)*min, (y2-y1)*min);
  }
}

void mousePressed() {
  d1=map(mouseY, 0, a, 8, 30);//控制概率1（越上越复杂）
  d2=map(mouseX, 0, a, 120, 1000);//控制概率2(越左越复杂)
  for (int i=0; i<x.length; i++) {
    d=random(d1);
    if (d<1) {
      x[i]=true;
    } else {
      x[i]=false;
    }
  }
  for (int i=0; i<y.length; i++) {
    d=random(d1);
    if (d<1) {
      y[i]=true;
    } else {
      y[i]=false;
    }
  }
}
void keyPressed() {
  if (key=='1')n=1;
  if (key=='2')n=2;
  if (key=='3')n=3;
  if (key=='4')n=4;
}
