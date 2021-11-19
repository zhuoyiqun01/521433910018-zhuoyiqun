class Ball {

  PVector speed;
  PVector gravity;
  float w;
  float life = 255;
  color c;
  PVector a;
  float m;
   PVector pos;
  Ball(float tempX, float tempY, float tempW) {
    pos=new PVector(tempX, tempY);
    w = tempW;
    speed = new PVector(0, 0);
    gravity = new PVector(0, 0.15);
    c=color(255, random(20, 250), 160);
    m=tempW;
  }

  void move() {
    speed.add(gravity);
    pos.add(speed);
    speed.mult(0.99);
  }

  boolean finished() {
    life-=0.5;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(c, life);
    ellipse(pos.x, pos.y, w, w);
  }
  void collision() {
    for (Ball tb : balls) {
      float dis=PVector.dist(tb.pos, this.pos);
      if (dis<(tb.w/2+w/2)) {
        a= PVector.sub(pos, tb.pos);
        a.mult(100/w/w);
        speed.add(a);
        //speed.limit(50);
        
      } else {
        a=new PVector(0,0);
      }
      
    }
  }
  void edge() {
    if (pos.x+w/2>width ) {
      pos.x=width-w/2;
      speed.x*=-0.7;
    }
    if (pos.x<w/2) {
      pos.x=w/2;
      speed.x*=-0.7;
    }
    if (pos.y >=height-w/2) {
      
      speed.y*=-0.8;
      pos.y=height-w/2;
       
    }
    if (pos.y<=w/2) {
      speed.y*=-0.8;
      pos.y=w/2;
    }
  }
}
