class DNA {

  float[] genes;
  int fitness;

  DNA() {
    fitness = 0;

    genes = new float[target.length];
    for (int i=0; i<genes.length; i++) {

      genes[i] = (float)round(random(0, 1)*100)/100;
    }
  }

  int fitness() {
    fitness = 0;
    for (int i=0; i<genes.length; i++) {

      if (abs(genes[i]- target[i]) < 0.01) {
        fitness += 1;
      }
    }
    return fitness;
  }

  DNA crossOver(DNA partner) {
    DNA crossGene = new DNA();
    int midPoint = (int)random(genes.length);
    for (int i=0; i<genes.length; i++) {
      if (i < midPoint) {
        crossGene.genes[i] = genes[i];
      } else {
        crossGene.genes[i] = partner.genes[i];
      }
    }
    return crossGene;
  }

  void mutation() {
    for (int i=0; i<genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (float)round(random(0, 1)*100)/100;
      }
    }
  }
}
