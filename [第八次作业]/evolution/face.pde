class Face {
  DNA dna;

  Face() {
    dna = new DNA();
  }

  void display() {
    float r = map(dna.genes[0], 0, 1, 0, 100);
    dna.genes[1] = map(dna.genes[1], 0, 1, 0, 255); 
    dna.genes[2] = map(dna.genes[2], 0, 1, 0, 255); 
    dna.genes[3] = map(dna.genes[3], 0, 1, 0, 255); 
    color bg = color(dna.genes[1], dna.genes[2], dna.genes[3]);
    float eye_left_x = -map(dna.genes[4], 0, 1, 0, 100);
    float eye_left_y = -map(dna.genes[5], 0, 1, 0, 100);
    float eye_right_x = map(dna.genes[6], 0, 1, 0, 100);
    float eye_right_y = -map(dna.genes[7], 0, 1, 0, 100);
    float eye_size = map(dna.genes[8], 0, 1, 0, 100);
    dna.genes[9] = map(dna.genes[9], 0, 1, 0, 255); 
    dna.genes[10] = map(dna.genes[10], 0, 1, 0, 255); 
    dna.genes[11] = map(dna.genes[11], 0, 1, 0, 255); 
    color dec_bg = color(dna.genes[9], dna.genes[10], dna.genes[11]);
    float mouth_x = -map(dna.genes[12], 0, 1, 0, 100);
    float mouth_y = map(dna.genes[13], 0, 1, 0, 100);
    float mouth_width = map(dna.genes[14], 0, 1, 0, 100);
    float mouth_height = map(dna.genes[15], 0, 1, 0, 100);
    dna.genes[16] = map(dna.genes[16], 0, 1, 0, 255); 
    dna.genes[17] = map(dna.genes[17], 0, 1, 0, 255); 
    dna.genes[18] = map(dna.genes[18], 0, 1, 0, 255); 
    color m_bg = color(dna.genes[16], dna.genes[17], dna.genes[18]);
    noStroke();
    fill(bg);
    ellipse(0, 0, r, r);

    fill(dec_bg);
    rect(eye_left_x, eye_left_y, eye_size, eye_size);

    rect(eye_right_x, eye_right_y, eye_size, eye_size);
    
    fill(m_bg);
    rect(mouth_x, mouth_y, mouth_width, mouth_height);
  }
}

class Button {
  float x, y, w, h;
  color bg;
  boolean ifOver;
  String text;
  int rounds;

  Button(float _x, float _y) {
    x = _x;
    y = _y;
    w = 150;
    h = 40;
    bg = color(255, 255, 255);
    ifOver = false;
    text = "Click to iterate";
    rounds = 0;
  }

  boolean ifOver(float mouse_x, float mouse_y) {
    if (mouse_x > x && mouse_x < x+w && mouse_y > y && mouse_y < y+h) {
      ifOver = true;
    } else {
      ifOver = false;
    }
    return ifOver;
  }

  void display() {
    noStroke();
    if(ifOver(mouseX, mouseY))fill(120);else fill(220);
    rect(x, y, w, h);
    fill(50);
    textSize(20);
    text(text, x+w/2-textWidth(text)/2, y+h/2+textDescent());
   textSize(40);
    text("#" + rounds, x, y-10);
  }
}
