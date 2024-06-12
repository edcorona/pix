 class AdnDibujo{
   //variables de clase
   //lista de tipo DnaTriangulo llamada triangulos
  ArrayList<DnaPoligono> poligonos;
  //variable booleana llamada EstaSucio
  boolean EstaSucio;
  
  //metodos
  
  //metodo que modifica la lista triangulos
  public void setPoligonos(ArrayList poligonos) 
  {
    this.poligonos=poligonos;
  }
  //metodo que devuelve la lista triangulos
  public ArrayList getPoligonos()
  {
    return poligonos;
  }
  //metodo que regresa EstaSucio 
  public boolean getSucio(){
  return EstaSucio;
  }
  //metodo que modifica el valor de EstaSucio
  public void setSucio(boolean EstaSucio){
    this.EstaSucio=EstaSucio;
  }
  
  
  //metodo entero para contabilizar puntos
  public int CuantosPuntos(){
    //instanciacion de clase DnaPoligono con nombre poligono
    DnaPoligono poligono= new DnaPoligono();
    //variable entera para contabilizar puntos
    int cuantosPuntos =0;
    //recorrido del tamaño de la lista poligonos
    for(int i=0;i<poligonos.size();i++){
      //poligono obtiene todos los poligonos con el get(i)
      poligono=poligonos.get(i);
      //duda---------------------------------------
      cuantosPuntos += poligono.getPuntos().size();
    }
    return cuantosPuntos;
  }
  
  
  //modifica el valor de EstaSucio a verdadero
  public void SetSucio(){
    EstaSucio=true;
  }
  
  //inicializacion 
  public void Init()
  {  
    //nueva lista de poligonos declarada al inicio de la clase AdnDibujo
    poligonos= new ArrayList<DnaPoligono>();
    
    //instanciacion de la clase Configuracion 
    //recorrido de 0 hasta el valor de activePoligonMin es 3,4,5 
    //               ActivePoligonMin= 4
    for(int i =0; i<Configuracion.ActivePoligonMin; i++){
      //addpoligono()
      AddPoligon();
    }
     SetSucio(); 
  }
  //metodo de tipo AdnDibujo
  public AdnDibujo Clone(){
    //instanciacion de tipo AdnDibujo dibujo
    AdnDibujo dibujo = new AdnDibujo();
    //dibujo obtencion de triangulos es un arraylista de tipo Dnatriangulos
    //inicializacion de lista
    dibujo.poligonos= new ArrayList<DnaPoligono>();
    //recorrido de arraylist
    for(int i =0;i<poligonos.size();i++){
      //variable de instanciacion que se le asigna el indice de la
      DnaPoligono poligono= poligonos.get(i);
      dibujo.poligonos.add(poligono.Clone());   
    }
    return dibujo;
  }
  public void Mutacion(){
    //el valor de la variable de la clase configuracion, activeAddTrianguloRadioMutacion es de 700
    if(Herramientas.VaMutar(Configuracion.ActiveAddPoligonRadioMutacion)){
      AddPoligon();
    }
    if(Herramientas.VaMutar(Configuracion.ActiveRemovePoligonRadioMutacion)){
      RemovePoligon();
    }
    if(Herramientas.VaMutar(Configuracion.ActiveMovePoligonRadioMutacion)){
      MovePoligon();
    }
    for(int i=0;i<poligonos.size();i++){
      poligonos.get(i).Mutacion(this);
    }
  }
  public void AddPoligon(){
    //condicional si el tamaño de la lista triangulos es menor a 255
    //instanciacion de la clase Configuracion variable ActiveTrianguleMax=255
    if(poligonos.size()<Configuracion.ActivePoligonMax){
      //instancia de la clase DnaPoligono llamada nuevoTriangulo
      //iniciacion de metodo init con nuevoTriangulo
      DnaPoligono nuevoPoligono= new DnaPoligono();
      nuevoPoligono.Init();
      
      int index=int(random(0, poligonos.size()));
      //add en vez de insert
      poligonos.add(index, nuevoPoligono);
      SetSucio();      
    }
  }
  public void RemovePoligon(){
    if(poligonos.size()> Configuracion.ActivePoligonMin){
      int index= int(random(0, poligonos.size()));
      poligonos.remove(index);
      SetSucio(); 
    }
  }
  public void MovePoligon(){
    if(poligonos.size() <1){
      return;
    }
    int index = int(random(0, poligonos.size()));   
      DnaPoligono poli= poligonos.get(index);
      poligonos.remove(index);
      index= int(random(0, poligonos.size()));
      poligonos.add(index, poli);
      SetSucio(); 
  }
  
  
  
}
//terminada todo bien
