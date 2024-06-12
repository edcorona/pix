class AdnTrazo
{
    float rojo;
    float verde;
    float azul;
    float alpha;
    public float getRojo(){
     return rojo;
    }
    public void setRojo(float rojo) {
      this.rojo=rojo;
    }
    public float getVerde(){
      return verde;
    }
    public void setVerde(float verde){
       this.verde=verde;
    }
    public float getAzul(){
      return azul;
    }
    public void setAzul(float azul){
       this.azul=azul;
    }
    public float getAlpha(){
      return alpha;
    }
    public void setAlpha(float alpha){
       this.alpha=alpha;
    }
    public void Init(){
     
      rojo= random(0,255);
     
      azul= random(0,255);
    
      verde= random(0,255);
     
      alpha= random(25.5,153); 
    }
    
    public AdnTrazo Clone(){
       
       AdnTrazo temp = new AdnTrazo();
       temp.setRojo(this.rojo);
       temp.setAzul(this.azul);
       temp.setVerde(this.verde);
       temp.setAlpha(this.alpha);
       
       return temp;
    } 
    public void mutacion(AdnDibujo dibujo)
    {
      //duda
      //condicional donde comprueba si desde la clase con su metodo VaMutar con la otra clase Configuracion
      //la variable ActivoRojoRadioMutacion = 1500
      if(Herramientas.VaMutar(Configuracion.ActivoRojoRadioMutacion))
      {
        rojo=random(0,255);
        //println("rojo: "+rojo);
        dibujo.SetSucio();
      }
      //ActivoVerdeRadioMutacion = 1500
      if(Herramientas.VaMutar(Configuracion.ActivoVerdeRadioMutacion))
      {
        verde=random(0,255);
        //println("verde: "+ verde);
        dibujo.SetSucio();
      }
      //ActivoAzulRadioMutacion = 1500
      if(Herramientas.VaMutar(Configuracion.ActivoAzulRadioMutacion))
      {
        azul=random(0,255);
        //println("azul: "+azul);
        dibujo.SetSucio();
      }
      //ActivoAlphaRadioMutacion = 1500
      if(Herramientas.VaMutar(Configuracion.ActivoAlphaRadioMutacion))
      {
        alpha=random(25.5,153);
        //println("alpha: "+alpha);
        //cambia el valor de boolean lo reinicia
        dibujo.SetSucio();
      }
    }
}
