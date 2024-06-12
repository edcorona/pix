public class DnaPunto
{
  int X, Y;
  //metodo que regresa la variable x de posicion horizontal
  public int getX(){
    return X;
  }
  //metodo que modifica el valor de la variable de clase x en posicion vertical
  public int setX(int X){
    return this.X=X;
  }
  public int getY(){
    return Y;
  }
  public int setY(int Y){
    return this.Y=Y;
  }
  public void Init(){
    X= int(random(0, MaxWidth));
    Y= int(random(0, MaxHeight));
  }
  
  public DnaPunto Clone()
  {
    
      DnaPunto temp = new DnaPunto();
      temp.setX(this.X);
      temp.setY(this.Y);
      
      return temp;  
  }
  
  public void VaMutar(AdnDibujo dibujo)
  {
    //ActiveMovePuntoMutacionRadio = 1500
    if(Herramientas.VaMutar(Configuracion.ActiveMovePuntoMutacionRadio))
    {
      //inicializa los valores de X y Y con valor random entre el 0 y el valor que le damos de maximo de ancho en X y alto en Y en el main de dependiendo del tamaño de la imagen que pasemos
      
      X= int(random(0,MaxWidth));
      Y= int(random(0,MaxHeight));
      dibujo.SetSucio();
    }
    //AcitveMovePuntoMidMutacionRadio = 1500
    if(Herramientas.VaMutar(Configuracion.AcitveMovePuntoMidMutacionRadio))
      {
        //math min regresa el minimo de dos numeros y max el maximo
                                           //AcitveMovePointRangeMid = 20
        X=Math.min(Math.max(0,X+int(random(-Configuracion.AcitveMovePointRangeMid,Configuracion.AcitveMovePointRangeMid))), MaxWidth);
        //mejorar                           
        Y=Math.min(Math.max(0,Y+int(random(-Configuracion.AcitveMovePointRangeMid,Configuracion.AcitveMovePointRangeMid))), MaxHeight);
        dibujo.SetSucio();
      }
      
      if(Herramientas.VaMutar(Configuracion.AcitveMovePuntoMinMutacionRadio)){
                                            //ActiveMovePointRangeMin = 3
        X=Math.min(Math.max(0,X+int(random(-Configuracion.ActiveMovePointRangeMin,Configuracion.ActiveMovePointRangeMin))), MaxWidth);
        //mejorar
        Y=Math.min(Math.max(0,Y+int(random(-Configuracion.ActiveMovePointRangeMin,Configuracion.ActiveMovePointRangeMin))), MaxHeight);
        dibujo.SetSucio();
      }
      
  }

}
