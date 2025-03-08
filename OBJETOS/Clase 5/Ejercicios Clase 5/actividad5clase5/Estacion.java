public abstract class Estacion {
  private String nombre;
  private double lat;
  private double lon;
  
  public Estacion (String nombre, double lat, double lon) {
    this.setNombre(nombre);
    this.setLat(lat);
    this.setLon(lon);
  }
  
  public Estacion () {
      
  }
  
  public String getNombre() {
    return nombre;
  }
  
  public double getLat() {
    return lat;
  }
  
  public double getLon() {
    return lon;
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  
  public void setLat(double lat) {
    this.lat = lat;
  }
 
  public void setLon(double lon) {
    this.lon = lon;
  }

}