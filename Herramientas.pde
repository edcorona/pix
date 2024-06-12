import java.util.Random;
public static class Herramientas{
  //private readonly palabra clave random
  
  //private static readonly Random random = new Random();
  private static Random random= new Random();
  
  public static int getNumeroRandom(int min, int max)
  {
    return random.ints(min,max).findFirst().getAsInt(); 
  }

  public static boolean VaMutar(int mutationRate)
  {
    //getNumeroRnadom regresa un int random dentro del minimo y maximo de un rango
    if(getNumeroRandom(0, mutationRate) == 1)
    {
      return true;
    }
    return false;
  }


}
