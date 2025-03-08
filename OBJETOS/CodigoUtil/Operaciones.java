public class Operaciones{
    int[] miMatriz = new int[5];   //vector de enteros
    int[][] miMatrizBidimensional = new int[3][4];// matriz de enteros 
}

public String toString () {
      String aux;
      aux= (" codigo: " + this.getCod() + "Titulo: " + this.getTitulo() + "Nombre del responsable: " + this.getResponsable().getNombre() );
      return aux;   
    }
    
