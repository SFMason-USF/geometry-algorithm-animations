float SlopeFromAngle(float angle) {
  if (angle < 0)
    angle = 360 - angle;
  angle %= 360;
  return tan(radians(angle));
}

interface Shape {
  public void Render();
}

public class AnimationShape {
  public Shape shape;
  //Whether the shape will continue to render after its initial appearance
  //Useful for giftwrapping, where you show the line rotating into position 
  public boolean persistent;

  public AnimationShape(Shape shape, boolean persistent) {
    this.shape = shape;
    this.persistent = persistent;
  }
}

class Point implements Shape {
  public int x, y;

  public Point() {
    this(0, 0);
  }

  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public void Render() {
    ellipseMode(RADIUS);
    fill(0);
    noStroke();
    ellipse(x, y, 2, 2);
  }
}

class LineSegment implements Shape {
  public int x1, y1, x2, y2;
  public boolean drawEndpoints;

  public LineSegment() {
    this(0, 0, 0, 0);
  }

  public LineSegment(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    drawEndpoints = true;
  }

  public LineSegment(Point p1, Point p2) {
    this(p1.x, p1.y, p2.x, p2.y);
  }

  public void Render() {
    stroke(0);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    if (drawEndpoints) {
      noStroke();
      fill(0);
      ellipseMode(RADIUS);
      //don't know why, but moving them down a pixel looks way better
      ellipse(x1, y1 + 1, 2, 2);
      ellipse(x2, y2 + 1, 2, 2);
    }
  }
}

class Line implements Shape {
  public int x, y;
  public float angle;

  public Line() {
    this(0, 0, 0);
  }

  public Line(int x, int y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
  }

  public void Render() {
    stroke(200);
    strokeWeight(1);
    int endX = (int)(cos(radians(angle)) * (Integer.MAX_VALUE - width)) + x, 
      endY = (int)(sin(radians(angle)) * (Integer.MAX_VALUE - height)) + y;
    line(x, y, endX, endY);
  }
}