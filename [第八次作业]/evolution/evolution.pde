Face[] faces;
ArrayList<Face> matingPool;
float[] target = {0.85, 0.95, 0.8, 0.49, 0.25, 0.25, 0.25, 0.25, 0.15, 0, 0, 0, 0.4, 0.2, 0.8, 0.15,0.5,0.5,0.6};
float mutationRate = 0.01;
int populationNumber = 1000;
int displayNumber = 5;
Button btn;

void setup() {
  size(1300, 600);
  background(255);
  faces = new Face[populationNumber];
  btn = new Button(100, height-50);
  for (int i=0; i<faces.length; i++) {
    faces[i]= new Face();
  }
  populationShow();
}

void draw() {
  
  btn.ifOver(mouseX, mouseY);
  btn.display();
  
}

void populationShow() {  
  for (int i=0; i<displayNumber; i++) {
    pushMatrix();
    translate((width/displayNumber*i)+85, height/2);
    faces[i].display();
    fill(0, 0, 0);
    text("Fitness:"+faces[i].dna.fitness(), 0, -200);
    popMatrix();
  }
}

void mousePressed() {
  if (btn.ifOver) {
    btn.rounds++;
    //Iteration
    matingPool = new ArrayList<Face>();
    for (int i=0; i<faces.length; i++) {
      faces[i].dna.fitness();
      for (int j=0; j<faces[i].dna.fitness; j++) {
        matingPool.add(faces[i]);
      }
    }
    background(255, 255, 255);
    for (int i=0; i<faces.length; i++) {
      Face father = matingPool.get((int)random(matingPool.size()));
      Face mother = matingPool.get((int)random(matingPool.size()));
      faces[i].dna = father.dna.crossOver(mother.dna);
      faces[i].dna.mutation();
    }
    populationShow();
    btn.display();
  }
}
