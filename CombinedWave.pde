class CombinedWave{
  
ArrayList<Wave> waves = new ArrayList<Wave>();
CombinedWave(ArrayList<Wave> w){
waves = w;
}

void show(float time, float spacial_resolution, float x_max){
    float x_pos = 0;
    float x = 0;
    float y_pos = 0;
    float y=0;

    float px_pos = 0;
    float py_pos = 0;
    
  for(int i = 0; i<spacial_resolution;i++){
      y_pos = 0;
      //println(width);
      x_pos = (width/spacial_resolution)*i;
      x = (x_max/spacial_resolution)*i;
      for(Wave w : waves){
      y = w.getAmplitude(time,i);
      y_pos+=y;
      }
      
      y_pos = y_pos-21;
      
      
       if(i>1){
      stroke(#FF0313);
      strokeWeight(2);
      line(x_pos,y_pos,px_pos,py_pos);}
      px_pos=x_pos;
      py_pos=y_pos;
  
    }
  
  

}



}
