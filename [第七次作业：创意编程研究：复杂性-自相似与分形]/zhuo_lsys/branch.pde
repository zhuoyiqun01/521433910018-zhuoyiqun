class branch {
  PVector start;
  float ang;
  float x;

  branch(PVector a, float ang_,float x_) {
    start = a.get();
    ang=ang_;
    x=x_;
  }

  void display() {
    PVector v=new PVector(0,-1);
    v.mult(x);
    v.rotate(ang);
    stroke(0);
    strokeWeight(2);
    line(start.x, start.y,start.x+v.x, start.y+v.y);
  }
  
}
