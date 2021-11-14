class LSystem {

  int steps = 0;

  String axiom;
  String rulef;
  String rulex;
  String production;

  float startLength;
  float drawLength;
  float theta;

  int generations;

  LSystem() {
    axiom = "F";
    rulex = "F[+X]F[-X]F[-X]+X";
    rulef ="FF+[+F-F-F]-[-F+F+F]";
    startLength = 190.0;
    theta = radians(map(mouseX, 0, width, 20, 40));
    reset();
  }

  void reset() {
    production = axiom;
    drawLength = startLength;
    generations = 0;
  }

  int getAge() {
    return generations;
  }

  void render() {

    steps += 5000;
    if (steps > production.length()) {
      steps = production.length();
    }
    for (int i = 0; i < steps; i++) {
      char step = production.charAt(i);
      
      if (step == 'F') {
        line(0, 0, 0, -drawLength);
        translate(0, -drawLength);
      } else if (step == '+') {
        rotate(theta+wind);
      } else if (step == '-') {
        rotate(-theta+wind);
      } else if (step == '[') {
        pushMatrix();
      } else if (step == ']') {
        popMatrix();
      }
    }
    
  }

  void simulate(int gen) {
    while (getAge() < gen) {
      production = iterate(production, 'F', rulef);
      production = iterate(production, 'X', rulex);
    }
  }

  String iterate(String prod_, char c, String rule_) {
    drawLength = drawLength * random(0.5, 0.8);
    generations++;
    String newProduction = prod_;
    newProduction = newProduction.replaceAll(str(c), rule_);
    return newProduction;
  }
}
