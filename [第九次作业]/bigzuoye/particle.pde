class particle {
  float x;
  float y;
  float r;
  color c;
  int asc;
  particle(float xx, float yy, int asc2) {
    x=xx;
    y=yy;
    r=10;
    asc=asc2;
    c=color(255, 255-(asc-97)*10, 160);
  }
  void display() {
    fill(c);
    ellipse(x, y, r, r);
  }
}
