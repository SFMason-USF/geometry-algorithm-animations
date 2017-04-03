Button start, stop, reset;
void setup() {
  size(640, 480);
  start = new Button(5, 5, 120, 35, "Start");
  stop = new Button(5, 45, 120, 35, "Stop");
  reset = new Button(5, 85, 120, 35, "Reset");
}

void draw() {
  background(255);
  //Render all buttons
  start.Render();
  stop.Render();
  reset.Render();
  if (start.MouseOver() || stop.MouseOver() || reset.MouseOver())
    cursor(HAND);
  else
    cursor(ARROW);
}

void mouseClicked() {
  if (start.ExecuteCLick()) {
    println("Start animation");
  }

  if (stop.ExecuteCLick()) {
    println("Stop animation");
  }

  if (reset.ExecuteCLick()) {
    println("Reset animation");
  }
}