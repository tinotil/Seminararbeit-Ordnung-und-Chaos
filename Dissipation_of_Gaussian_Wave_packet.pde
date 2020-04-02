int n=1000;
int count = 9;


float[] inputs = new float[n];
Phasor[] fourier;
float pre_cut_length;

float px;
float py;

float psiny;

float[] pys;
color[] colors;

ArrayList<CombinedWave> CombinedWaves = new ArrayList<CombinedWave>();
ArrayList<Wave> waves = new ArrayList<Wave>();

float time = 0;



Phasor[] dft_phasor (float[] x) {

  int N = x.length;
  Phasor[] X = new Phasor[N];
  for (int k = 0; k < N; k++) {
    float re = 0;
    float im = 0;
    for (int n = 0; n < N; n++) {
      float phi = (TWO_PI * k * n) / N;
      re += x[n] * cos(phi);
      im -= x[n] * sin(phi);}

    re = re / N;
    im = im / N;


    float freq = k;
    float amp = sqrt(re * re + im * im);
    float phase = atan2(im,re);
    X[k] = new Phasor(amp, freq, phase);
}

  return X;}




float gaussian(float input){
  float scaled_input = input/50;
  
  float output = exp(-scaled_input*scaled_input);
  //println(output);
  return output;
}


Phasor[] cutFourier(Phasor[] inputs, int top_n){
  Phasor[] output = new Phasor[top_n];
  for(int i=0;i<top_n;i++){
    output[i]=inputs[i];
  }
  return output;
  
}

void mousePressed(){
save("Gauss_Pulse_propagating.png");
print("saved");

  }

void setup(){
size(600,600);

for(int i =0; i<n;i++){
  inputs[i] = gaussian(i-450);
  
}



fourier = dft_phasor(inputs);

//Sort(fourier);
pre_cut_length = fourier.length;  
fourier = cutFourier(fourier,count+1);
pys = new float[count];
colors = new color[count];
for(int i = 0; i<count;i++){
  colors[i]= color(random(255), random(255), random(255), 60);

}

for(Phasor p : fourier){
  if(p.frequency != 0.0){
  waves.add(new Wave(p));
  }
}

CombinedWaves.add(new CombinedWave(waves));





}

void draw(){
background(255);
translate(10,height-height/4);
stroke(0);
line(0,0,1000,0);

for(Wave w : waves){
  w.show(time,n,width);
}

for(CombinedWave cw : CombinedWaves){
  cw.show(time,n,width);
}

time += (TWO_PI)/(float)pre_cut_length;

if(frameCount == 1){

save("Gauss_Pulse_stationary.png");
print("saved");

}





}















/*void draw(){
background(255);
translate(10,height-height/8);
stroke(0);
line(0,0,1000,0);
for(int i =0; i<n;i++){
    float y = -inputs[i]*height/1.2;
  float x = (width/(float)n)*i;
 
  
  
  float sin_y = 0;
  int counter = 0;
  for(Phasor p : fourier){
    float subtractor = p.amplitude * sin(p.frequency * i*(TWO_PI/pre_cut_length)+p.phase+HALF_PI)*height/1.2;
    sin_y -= subtractor;
    pys[counter]=subtractor;
    counter++;
  }
  
  if(i >1){

  strokeWeight(1);
  stroke(0);
  line(x,y,px,py);
   strokeWeight(1);
  stroke(#FF0307);
  line(x,sin_y,px,psiny);
  
  int counter2 = 0;
  for(float f : pys){
    stroke(colors[counter2]);
    point(x,f);
    counter2++;
  
  }
  
  
  
}
  
  px = x;
  py = y;
  psiny = sin_y;


}}*/
