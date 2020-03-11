class DNA{
  float fitness;
  char genes[];
  
  DNA(int num){
    genes = new char[num];
    for (int i = 0; i < genes.length; i++){
      genes[i] = (char) random(32,128);                  //Initialize the array, and set random chars in it
    }
    }
    
    String get_string(){
      return new String(genes);                          // Get array and covert to String
    }
    
    
    void calc_Fintess(){
      int score = 0;
      for (int i = 0; i < genes.length; i++){
        if (genes[i] == target.charAt(i)){
          score++;        
        }
        
      }
      fitness = (float)score / (float)target.length();
    }
    
    DNA crossover(DNA partner){
      DNA child = new DNA(genes.length);
      int mid_point = int(random(genes.length));
      
      for (int i = 0; i<genes.length; i++){
        if (i > mid_point ){
          child.genes[i] = genes[i];        
        } else {
          child.genes[i] = partner.genes[i];        
        }
      }
      return child;
    }
    
    void mutation(){
      for (int i = 0; i < genes.length; i++){
        if (random(1) < 0.01){
          genes[i] = (char) random (32,128);        
        }
      }
        
    
    }
  }
  
 
