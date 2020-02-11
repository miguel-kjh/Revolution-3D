public class LineOfPoints {
  ArrayList<Point> listOfPoints = new ArrayList();
  
  public void addPoint(Point point){
    listOfPoints.add(point);
  }
  
  public void drawLine(){
    for(int index = 0; index < listOfPoints.size() - 1; index++){
        Point firstPoint = listOfPoints.get(index);
        Point secondPoint = listOfPoints.get(index+1);
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
