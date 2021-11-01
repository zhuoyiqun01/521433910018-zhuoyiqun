
ArrayList<Ball> balls;
int ballWidth = 48;


void setup() {
  size(720, 600);
  noStroke();
  balls = new ArrayList<Ball>();
  
  // Start by adding one element
  balls.add(new Ball(width/2, 0, ballWidth));
}

void draw() {
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
  if(mousePressed) {
  ballWidth=int(random(10,150));
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}

  
}
