//IMG pequeñas
//Imagen ch 300x352 chPerla.jpg
//Imagen chN 300x352 chPerlaN.jpg

//IMG medianas
//Imagen mediana 600x703 medPerla.jpg
//Imagen medianaN 600x703 medPerlaN.jpg

//IMG Grande
//Imagen grande 950x1050  grandPC.jpeg
//Imagen grande 950x1050  grandPBN.jpeg

private int [][] sourceColors;
private AdnDibujo currentDibujo;
private int generacion;
private FitnessCalculator calculator;
private Renderer render;
private double errorLevel = Double.MAX_VALUE;

// Es el número entero máximo posible que se puede representar en 32 bits. Su valor exacto es 2147483647

public int MaxWidth = 300;
public int MaxHeight = 352;
PFont f;
PImage target ;
void setup(){
  size(300,352);
  f = createFont("Courier", 12, true);
  loadPixels();
  target = loadImage("/data/chPerlaN.jpg");
  updatePixels();
   render = new Renderer();
  setupSourceColorMatrix();
  calculator= new FitnessCalculator();
  currentDibujo = getNewInicializacion();
}
void draw()
{
  
  
   AdnDibujo nuevoDibujo;
   
   nuevoDibujo = currentDibujo.Clone();
   nuevoDibujo.Mutacion(); 
  if(nuevoDibujo.getSucio()){
    generacion++;
    double nuevoErrorlevel = calculator.GetDrawingFitness(nuevoDibujo, 
                                      sourceColors, render, generacion);
    
    if(nuevoErrorlevel <= errorLevel){
      currentDibujo = nuevoDibujo;
      errorLevel = nuevoErrorlevel;
    }
  }
}

private void setupSourceColorMatrix()
{
  sourceColors = new int [MaxWidth][MaxHeight];
  
  
  for (int y=0; y< MaxHeight; y++)
  {
    for(int x = 0; x < MaxWidth; x++)
    {
      int loc = x + y*width;
      float r = red(target.pixels[loc]);
      float g = green(target.pixels[loc]);
      float b = blue(target.pixels[loc]);
      float a = alpha(target.pixels[loc]);
      
      sourceColors[x][y]= color(r,g,b,a);
     
    }
  }
  
}
private AdnDibujo getNewInicializacion(){
  AdnDibujo dibujo= new AdnDibujo();
   dibujo.Init();
   return dibujo;
}
