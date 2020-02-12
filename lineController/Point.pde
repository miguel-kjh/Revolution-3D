public class Point {
  float x,y,z;
  
  public Point(float x,float y){
    this.x = x;
    this.y = y;
    this.z = 0;
  }
  
  public Point(float x,float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public Point getTranslate(){
    return new Point(x - width/2,y - height/2);
  }
}
