color c;
int r=0;
int g=0;
int b=0;
int flag=0;
int sw1=19;
int sw2=19;
void setup() {
  size(1400, 1000);
  noStroke();
  fill(255);
  rect(0, 0, 1000, 1000);
  rgb();
  strokeweight();
}
void draw() {
  rgb();
  strokeweight();
  text("按'B'画笔 按'E'橡皮",1025,30);
  if(flag==0){brush();}
  if(flag==1){eraser();}
  //else{colorcollect();}
}
void keyPressed(){
if(key=='b'){flag=0;}
if(key=='e'){flag=1;}
}
void rgb() {
  noStroke();
  for (int i=0; i<256; i++) {
    fill(i, g, b);
    rect(1100+i, 100, 1, 10);
    fill(r, i, b);
    rect(1100+i, 130, 1, 10);
    fill(r, g, i);
    rect(1100+i, 160, 1, 10);
   }
    fill(r, g, b);
    rect(1020, 100, 50, 50);
    fill(120);
    rect(1365,100,30,25);
    rect(1365,130,30,25);
    rect(1365,160,30,25);
    
  fill(0);
  text('R',1085,115);
  text('G',1085,145);
  text('B',1085,175);
  text(r,1370,115);
  text(g,1370,145);
  text(b,1370,175);
  if(mouseX>1100&&mouseX<1356&&mouseY>100&&mouseY<110){
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(1100,100,256,10);
    if(mousePressed){
    r=mouseX-1100;
    }
  }
  if(mouseX>1100&&mouseX<1356&&mouseY>130&&mouseY<140){
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(1100,130,256,10);
    if(mousePressed){
    g=mouseX-1100;
    }
  }
  if(mouseX>1100&&mouseX<1356&&mouseY>160&&mouseY<170){
    noFill();
    stroke(255);
    strokeWeight(1);
    rect(1100,160,256,10);
    if(mousePressed){
    b=mouseX-1100;
    }
  }
  stroke(255);
  strokeWeight(4);
  noFill();
  line(1100+r,100,1100+r,110);
  line(1100+g,130,1100+g,140);
  line(1100+b,160,1100+b,170);
  
}
void strokeweight(){
  noStroke();
  fill(100);
  rect(1100,200,256,25);
  fill(120);
  rect(1365,200,30,25);
  fill(0);
  text(sw1,1370,215);
  if(mouseX>1100&&mouseX<1356&&mouseY>200&&mouseY<225){
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(1100,200,256,25);
    if(mousePressed){
    sw1=mouseX-1100;
    }
  }
  stroke(255);
  strokeWeight(4);
  noFill();
  line(1100+sw1,200,1100+sw1,225);
  

}
void brush() {
  if (mouseX<1000 && mousePressed) {
    stroke(r, g, b);
    strokeWeight(sw1);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
void eraser(){
  if (mouseX<1000 && mousePressed) {
    stroke(255);
    strokeWeight(sw1);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
