class Wave{
  Phasor params;
  float px;
  float psiny;
  float[] hue;

  Wave(Phasor input){
  params = input;
  hue = new float[]{random(255), random(255), random(255), 60};
    
  }
  
void show(float time, float n, float x_max){
 
 for(int i =0; i<n;i++){    
    float x = (width/(float)n)*i;  
    float sin_y = 0;
    
    float omega = sqrt((float)(9.81*params.frequency*Math.tanh(params.frequency*0.5)));
    float time_shift = omega*time;
   
    float subtractor =-params.amplitude * sin(params.frequency * i*(TWO_PI/pre_cut_length)+params.phase+HALF_PI-time_shift)*height/1.2;
    sin_y = subtractor;        
  
    if(i >2){     
      stroke(hue[0],hue[1], hue[2],hue[3]);
      line(x,sin_y,px,psiny); 
  
    }
  
    px = x;
    psiny = sin_y;

  }
}


    
float getAmplitude(float time, float i){     
    float x = (width/(float)n)*i;  
    float sin_y = 0;    
    float omega = sqrt((float)(9.81*params.frequency*Math.tanh(params.frequency*0.5)));
    float time_shift = omega*time;   
    float subtractor = -params.amplitude * sin(params.frequency * i*(TWO_PI/pre_cut_length)+params.phase+HALF_PI-time_shift)*height/1.2;
    sin_y = subtractor;      
    return sin_y;     
}
   
    
}  
  
  
  
