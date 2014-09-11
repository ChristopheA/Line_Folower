/**
 * Classe Capteur de lumiere
 * @author Aubert Christophe
 * @version 1
 */

public class Sensor extends ObjectWithRelativeLocation implements Drawable{

  //definition de constante
  final color RED = #FF0000;
  
  private PImage sensorPath;
  private int sensorWidth;
  private int sensorHeight;

  //Contructeur de la classe sensor
  public Sensor(PImage path, PVector offsetLocation, int sWidth, int sHeight ) {

    super(offsetLocation);
    this.sensorPath = path; //mise en memoire sur circuit
    this.sensorWidth = sWidth; //attribution arbitraire d'une longeur de capteur
    this.sensorHeight = sHeight; //attribution arbitraire d'une largeur de capteur
  }
  //Lecture du capteur  
  public float readValue(PVector NotRelativeSensorPosition) {
    //variable temporaire
    int tmpWidth = 0;
    int tmpHeight = 0;
    int tmpIndex = 0;
    color tmpColor;
    double sumColors = 0.0;
    //instruction
    tmpWidth = this.sensorWidth / 2; // distance dx du centre par rapport au debut du capteur.
    tmpHeight = this.sensorHeight / 2; //distance dy du centre par rapport au debut du capteur.
    //lecture du capteur
    for (int i = 0; i < this.sensorHeight; i++) {
      for (int j = 0; j < this.sensorWidth; j++) {
        //println("index : " + tmpIndex );
        tmpIndex = (int(NotRelativeSensorPosition.x)- tmpWidth + j) + ((int(NotRelativeSensorPosition.y)- tmpHeight + i)* this.sensorPath.width); //Premier pixel du capteur sur le circuit.
        tmpColor = this.sensorPath.pixels[tmpIndex]; //on recupere la valeur du pixel
        sumColors += (blue(tmpColor) + red(tmpColor) + green(tmpColor)) / (255 * 3.0);
      }
    }
    return (float)(1.0 - sumColors / (sensorHeight * sensorWidth));
  }
  //Methode dessin du capteur
  public void draw() {
    pushMatrix();
    translate(super.getLocation().x, super.getLocation().y);
    fill(RED);
    stroke(0);
    rectMode(CENTER); //positionement par le centre
    rect(0, 0, sensorWidth, sensorHeight);
    popMatrix();
  }
}
