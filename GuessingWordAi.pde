String target;
Boolean completed;
String display;
DNA[] population;
ArrayList<DNA> mating_pool;
PFont f;
int total_pop = 150;
long tStart;
long tEnd;
long tDelta;
double elapsedSeconds;
double current_fitness;

void setup(){
  size(600,600); 
  target = "Great";
  completed = false;
  display = "The Word is :";
  f = createFont("David",12,true);
  tStart = System.currentTimeMillis();
  population = new DNA[total_pop];
  create_pop();
  
    
  
}


void draw(){
    background(255);
    fill(0);
    textFont(f,20);
    text(display,70,70,width,height);
    text(target,70,100,width,height);
    manage_pop();
    manage_result();
    }
    
void create_pop(){
    population = new DNA[total_pop];
    for (int i = 0; i < population.length;i++){
      population[i] = new DNA(target.length());
    }}

void manage_pop(){
for (int i = 0; i < population.length; i++){
    population[i].calc_Fintess();
  }
  ArrayList<DNA> mating_pool = new ArrayList<DNA>();
  for (int j = 0; j < population.length; j++){
    int num = int(population[j].fitness * 100);
    current_fitness = population[j].fitness;
      for (int k = 0; k < num; k++){
        mating_pool.add(population[j]);
      }
  }
  for (int p = 0; p < population.length; p++){
    int a = int(random(mating_pool.size()));
    int b = int(random(mating_pool.size()));
    DNA partnerA = mating_pool.get(a);
    DNA partnerB = mating_pool.get(b);
    DNA child = partnerA.crossover(partnerB);
    child.mutation();
    population[p] = child;  
  }
}

void manage_result(){
    background(255);
    fill(0);
    String everything = "";
    for (int r = 0; r < population.length;r++){
       everything = population[r].get_string();
    }
    textFont(f,40);
    text("Target : "+ everything,10,10,width,height);
    text("Current Fitness : "+ current_fitness,10,200,width,height);
    if (everything.equals(target)){
       tEnd = System.currentTimeMillis();
       tDelta = tEnd - tStart;
       elapsedSeconds = tDelta / 1000.0;
       String s=String.valueOf(elapsedSeconds);
       text("Total Time:" + s,10,300,width,height); 
       text("Successfully",10,400,width,height); 
       //delay(1000);
       noLoop();   
       }    
}
