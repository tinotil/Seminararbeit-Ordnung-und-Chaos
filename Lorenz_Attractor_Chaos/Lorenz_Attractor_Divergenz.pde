float a=10;
float b=28;
float c=8.0/3.0;


ArrayList<PVector> points = new ArrayList<PVector>();

ArrayList<PVector> curvepoints = new ArrayList<PVector>();

void setup(){
  size(800,800, P3D);
  colorMode(HSB);  
  float startx = -3;
  float starty = 0;
  float startz = -20;
  
  float shift = 0.0001;
  
  for(int i =0; i<1000;i++){
    points.add(new PVector(startx+shift*i,starty+shift*i,startz+shift*i));  
  }  
  
  curvepoints = mainAttractor();


}

ArrayList<PVector> mainAttractor(){
  ArrayList<PVector> mainpoints = new ArrayList<PVector>();
  float x=-3;
  float y=0;
  float z=-20;
  
  for(int i = 0; i<100*1000;i++){
  float dt =0.0005;  
  float dx = a * (y - x);
  float dy = x * (b - z) - y;
  float dz = x * y - c * z;
  
  x += dx*dt;
  y += dy*dt;
  z += dz*dt;
  
  mainpoints.add(new PVector(x,y,z));}
  return mainpoints;

}

void draw(){
  float dt =0.00001; 
  background(255);  
  translate(width/2,height/2); 
  strokeWeight(5);
  int counter = 1; 
  for (PVector p : points){  
  
    for(int i = 0; i<1000;i++){
          float dx = a * (p.y - p.x);
          float dy = p.x * (b - p.z) - p.y;
          float dz = p.x * p.y - c * p.z;
  
          p.x += dx*dt;
          p.y += dy*dt;
          p.z += dz*dt;   
    }
  
  
    float scaled_x=(400/30)*p.x;  
    float scaled_y=p.y;
    float scaled_z=(800/100)*-p.z+350; 
  
    stroke(255*counter*1/1000,255,255);   
    counter++;
    point(scaled_x,scaled_z,scaled_y); 
  
  }
  
  noFill();   
  beginShape();  
  for(PVector v : curvepoints ){ 
    stroke(0,60);
    strokeWeight(1.5);
    float scaled_x=(400/30)*v.x;  
    float scaled_y=v.y;
    float scaled_z=(800/100)*-v.z+350; 
    vertex(scaled_x,scaled_z,scaled_y); 
  }
  endShape(); 
}
