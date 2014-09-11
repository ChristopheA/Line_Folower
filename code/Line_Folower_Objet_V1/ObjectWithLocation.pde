/**
 * Classe Abstraite d'objet positionable
 * @author Aubert Christophe
 * @version 1
 */

/*abstract*/ class ObjectWithLocation {

  private PVector location;

  //Contructeur de la classe
  public ObjectWithLocation(PVector offsetLocation) {
    this.location = offsetLocation;
  }
  
  //acesseur
  public PVector getLocation(){
    return location;
  }
}
