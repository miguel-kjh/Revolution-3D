
public class CreateFigure {
  PShape figure;
  public CreateFigure(){
    figure = createShape();
  }
  
  public void starDraw(int fillColor, int strokeColor, float density){
    figure.beginShape(TRIANGLE_STRIP);
    figure.fill(fillColor);
    figure.stroke(strokeColor);
    figure.strokeWeight(density);
  }
  
  public void defineVertex(Point point){
    figure.vertex(point.x,point.y,point.z);
    for(float angle = 0.0f; angle <= PI*2; angle += 0.5f){
      point.x = point.x*cos(angle) - point.z*sin(angle);
      point.z = point.x*sin(angle) + point.z*cos(angle);
      figure.vertex(
        point.x*cos(angle) - point.z*sin(angle),
        point.y,
        point.z);
    }
  }
  
  public void createFigure(){
    figure.endShape(CLOSE);
    shape(figure);
  }
  
}
