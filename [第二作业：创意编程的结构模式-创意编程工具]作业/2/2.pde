color c6=color(110, 190, 190);
color c0=color(80, 155, 165);
color c1=color(235, 80, 130);
color c2=color(245, 255, 250);
color c3=color(50, 70, 80);
color c4=color(140, 230, 230);
color c5=color(225, 170, 180);
particle [] p=new particle[10];
  
  point[]pp=new point[5];


int dice=int(random(1, 7));
int dice2=int(random(1, 7));
int dice3=int(random(1, 7));
int dice4=int(random(1, 7));
float a=random(0, 360);
float i=a;
float j=a;
float x=random(200, 400);
float q=1;
float xz=random(0, 90);;
float r;
int n;
int np=int(random(4,7));
void setup() {
  size(600, 480);
  background(c0);
  strokeWeight(1);
  stroke(255);


  for (int i=0; i<p.length; i++) {
    p[i]=new particle();
  }
    for(int a=0;a<pp.length;a++){
    pp[a]=new point();}
}
void draw() {
  background(c0);
  strokeWeight(1);
  stroke(255);
  noFill();
  rect(580, 20, 10, 10);
  rect(580, 45, 10, 10);
  rect(580, 70, 10, 10);
   rect(580, 95, 10, 10);
   fill(255);
   textSize(15);
   textMode(CENTER);
   
   text("1",560,25);
   text("2",560,50);
   text("3",560,75);
   text("4",560,100);
   
  //1
  for (int i=0; i<p.length; i++) {

    if (dice==1) {
      p[i].drawparticle(c1);
    } else if (dice==2) {
      p[i].drawparticle(c2);
    } else if (dice==3) {
      p[i].drawparticle(c3);
    } else if (dice==4) {
      p[i].drawparticle(c4);
    } else if (dice==5) {
      p[i].drawparticle(c5);
    } else if (dice==6) {
      p[i].drawparticle(c6);
    }
  }
   //4
  if(abs(pp[0].pointxx-pp[0].pointx)>0.1){cshape();}
  //2
  drawarc();

  //3
  drawpolygon();

 
}
void keyPressed() {
 
  if (key=='1') {
    dice=int(random(1, 7));
    for (int i=0; i<p.length; i++) {
      p[i]=new particle();
    }
    noStroke();
    fill(255, 100);
    rect(580, 20, 10, 10);
  }
  if (key=='2'&j>a+360) {
    dice2=int(random(1, 7));
    a=random(0, 360);
    i=a;
    j=a;
    x=random(200, 400);
    noStroke();
    fill(255, 100);
    rect(580, 45, 10, 10);
  }
   if (key=='3'&q>560) {
    q=1;
    xz=random(0, 90);
    dice3=int(random(1, 7));
    noStroke();
    fill(255, 100);
    rect(580, 70, 10, 10);

    n=int(random(3, 7));
  }
   if (key=='4') {
    
    dice4=int(random(1, 7));
    noStroke();
    fill(255, 100);
    rect(580, 95, 10, 10);
       for(int a=0;a<pp.length;a++){
    pp[a]=new point();}

  }
}
void drawarc() {
  if (dice2==1) {
    fill(c1);
  } else if (dice2==2) {
    fill(c2);
  } else if (dice2==3) {
    fill(c3);
  } else if (dice2==4) {
    fill(c4);
  } else if (dice2==5) {
    fill(c5);
  } else if (dice2==6) {
    fill(c6);
  }
  if ( i<a+360) {
    noStroke();
    arc(300, 240, x, x, radians(j), radians(i));
    i=i+30-(i-a)/360*24;
  } else if (j<a+360) {
    noStroke();
    arc(300, 240, x, x, radians(j), radians(i));
    j=j+30-(j-a)/360*24;
  }
}
void drawpolygon() {
  if (dice3==1) {
    stroke(c1);
  } else if (dice3==2) {
    stroke(c2);
  } else if (dice3==3) {
    stroke(c3);
  } else if (dice3==4) {
    stroke(c4);
  } else if (dice3==5) {
    stroke(c5);
  } else if (dice3==6) {
    stroke(c6);
  }
  strokeWeight(random(5, 10));
  noFill();
  rectMode(CENTER);
  pushMatrix();
  if (q<1210&q>0) {
    translate(width/2, height/2);
    rotate(radians(q/600*45+xz));
    q=q+18;
    polygon(q, n);
  }
  popMatrix();
}
void polygon( float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx =  cos(a) * radius;
    float sy = sin(a) * radius;

    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void cshape() {

    
    beginShape();
    if (dice4==1) {
    stroke(c1);
  } else if (dice4==2) {
    stroke(c2);
  } else if (dice4==3) {
    stroke(c3);
  } else if (dice4==4) {
    stroke(c4);
  } else if (dice4==5) {
    stroke(c5);
  } else if (dice4==6) {
    stroke(c6);
  }
  strokeWeight(5);
  noFill();
  for (int a=0; a<5; a++) {
    
    vertex(pp[a].pointx, pp[a].pointy);
    pp[a].pointx+=(pp[a].pointxx-pp[a].pointx)/7;
    pp[a].pointy+=(pp[a].pointyy-pp[a].pointy)/7;
  }
  endShape(CLOSE);
}
