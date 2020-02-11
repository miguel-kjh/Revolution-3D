public class LineOfPoints {
  ArrayList<Point> listOfPoints = new ArrayList();
  
  public void addPoint(Point point){
    listOfPoints.add(point);
  }
  
  public void drawLine(){
    if(listOfPoints.size() > 0){
        Point initialPoint = listOfPoints.get(0);
        ellipse(initialPoint.x,initialPoint.y,10,10);
    }
    for(int index = 0; index < listOfPoints.size() - 1; index++){
        Point firstPoint = listOfPoints.get(index);
        Point secondPoint = listOfPoints.get(index+1);
        ellipse(firstPoint.x,firstPoint.y,10,10);
        ellipse(secondPoint.x,secondPoint.y,10,10);
        line(firstPoint.x,firstPoint.y,secondPoint.x,secondPoint.y);
    }
  }
  
  public void removeLine(){
    listOfPoints.clear();
  }
  
  public void removeLastLine(){
    if(listOfPoints.size() > 0){
      listOfPoints.remove(listOfPoints.get(listOfPoints.size() - 1));
    }
  }
  
  public Point getLast(){
    if(listOfPoints.size() == 0) return null;
    return listOfPoints.get(listOfPoints.size()-1);
  }
  
  public ArrayList<Point> getLine(){
    return listOfPoints;
  }
}
