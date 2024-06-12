  import java.io.*;
class FitnessCalculator
{
  public double GetDrawingFitness(AdnDibujo nuevoDibujo, int[][] sourceColors, Renderer render, int generacion)
  {
    double error = 0;
    //graphics es para pintar
    //render para pintar
    
    render.Render(nuevoDibujo);
    PImage lienzo = get();
 
     for(int y=0; y< MaxHeight; y++){
       for(int x=0; x < MaxWidth; x++)
       {
         //obtener el pixel del lienzo no la imagen
         
         //obtencion con get
         color c1 = GetPixel(lienzo, x, y);
         
         color c2 = sourceColors[x][y];
         
         double pixelError = GetColorFitness(c1,c2);
         error += pixelError;
       }    
     }
     //duda el usa Unlockbits aqui
     textFont(f);
     fill(255);
     text("Generacion: " +generacion +" p: " + Configuracion.AcitvePointPerPoligonMin,15,15);
     
     return error;
  }
  private color GetPixel(PImage currentImage, int x, int y)
  {
    //pasar imagen aqui
        return currentImage.get(x,y);
  }
  //metodo de obtener color fitness
  private double GetColorFitness(color c1, color c2)
  {
    double r=red(c1) - red(c2);
    double g=green(c1) - green(c2);
    double b=blue(c1) - blue(c2);
    
    return r*r + g*g + b*b; 
  }
}
