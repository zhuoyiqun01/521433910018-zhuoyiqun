class ppoint {
  boolean heima;
  int x;
  int y;
  ppoint(int x_, int y_) {
    loadPixels();
    if (pixels[y_*min*width+x_*min]==-16777216) {
      heima=true;
    } else {
      heima=false;
    }
    x=x_;
    y=y_;
  }
  void shakehands() {
    for (ppoint pp : p) {
      if (pp!=this&&pp.heima==true) {
        if (this.x==0||this.y==0||this.x==a/min||this.y==a/min||this.heima==true) {
          if (this.x==pp.x||this.y==pp.y) {
            float dice=random(d2);
            if (dice<1) {
              noFill();
              stroke(0);
              strokeWeight(6);
              line(pp.x*min, pp.y*min, x*min, y*min);
            }
          }
        }
      }
    }
  }
}
