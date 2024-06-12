public class DnaPoligono{
  ArrayList<DnaPunto> Puntos;
  AdnTrazo trazo;
  
  public ArrayList<DnaPunto> getPuntos(){
   return Puntos;
  }
  public void setPuntos(ArrayList Puntos) {
    this.Puntos=Puntos;
  }
  
  public AdnTrazo getTrazo(){
    return trazo;
  }
   public AdnTrazo setTrazo(AdnTrazo trazo){
     return this.trazo=trazo;
   }
   
   public void Init()
 {
   Puntos = new ArrayList<DnaPunto>();
   
   DnaPunto origin= new DnaPunto();
   origin.Init();
   //    AcitvePointPerPoligonMin = 4
   for(int i=0; i< Configuracion.AcitvePointPerPoligonMin; i++){
     DnaPunto punto= new DnaPunto();
     punto.setX(Math.min(Math.max(0, origin.getX() + int(random(-3,3))), MaxWidth));
     punto.setY(Math.min(Math.max(0, origin.getY()+ int(random(-3,3))), MaxHeight));
     
     Puntos.add(punto);
   }
   
   trazo= new AdnTrazo();
   trazo.Init();
 }
 
 public DnaPoligono Clone(){
   DnaPoligono nuevoPoligono = new DnaPoligono();
   
   nuevoPoligono.Puntos = new ArrayList<DnaPunto>();
   nuevoPoligono.trazo = trazo.Clone();
   
   for(int i=0;i<Puntos.size();i++){
     nuevoPoligono.Puntos.add(Puntos.get(i).Clone());
   }
   
   return nuevoPoligono;
 }
 
 public void Mutacion(AdnDibujo dibujo)
 {
   //VaMutar devuelve un true o false si
   //validación entre el 0 y ActivoAddPuntoRadioMutacion = 1500
   if(Herramientas.VaMutar(Configuracion.ActivoAddPuntoRadioMutacion))
   {
     
     AddPunto(dibujo);
   }
   
   if(Herramientas.VaMutar(Configuracion.ActivoRemovePuntoRadioMutacion))
   {
     RemovePunto(dibujo);
   }
   
   trazo.mutacion(dibujo);
   for(int i=0;i<Puntos.size();i++){
     DnaPunto p= Puntos.get(i);
     p.VaMutar(dibujo);
   }
 }
 
 private void RemovePunto(AdnDibujo dibujo){
   //si lalista de DnaPunto Puntos (tamaño) es mayor a 4
   if(Puntos.size() > Configuracion.AcitvePointPerPoligonMin){
     //si los puntos contabilizados es mayor a ActivePoligonMin = 4
     if(dibujo.CuantosPuntos() > Configuracion.ActivePoligonMin){
       //Se elimina de la lista Puntos a traves del indice
       int index = int(random(0, Puntos.size()));
       Puntos.remove(index);
       
       dibujo.SetSucio();
     }
   }
 }
 
 
 private void AddPunto(AdnDibujo dibujo){
    //si lalista de DnaPunto Puntos (tamaño) es menor a 10
   if(Puntos.size()< Configuracion.ActivePointPerPoligonMax){
       //si los puntos contabilizados es menor a ActivePuntosMax = 1500
     if(dibujo.CuantosPuntos() < Configuracion.ActivePuntosMax){
       //nueva variable de tipo DnaPunto
       DnaPunto nuevoPunto= new DnaPunto();
       //index asignado un valor entre 1 y un numero menor a la lista Puntos - excluyendo el primer elemento indice 0
       int index = int(random(1, Puntos.size()-1));
       
       //Se añade nuevo indice y nuevo punto a la lista de Puntos
       DnaPunto prev = Puntos.get(index - 1);
       
       DnaPunto next = Puntos.get(index);
       
       nuevoPunto.X = (prev.X + next.X)/2;
       nuevoPunto.Y = (prev.Y + next.Y)/2;
       
       Puntos.add(index,nuevoPunto);
       
       dibujo.SetSucio();
     }
   }
 }
}
//terminado duda en mutacion
