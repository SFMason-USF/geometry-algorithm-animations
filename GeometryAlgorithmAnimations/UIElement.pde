//Base class for UI elements
abstract class UIElement {
  protected int x, y, w, h;
  protected boolean enabled, visible;

  public UIElement(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  public abstract void Render();

  //Is the mouse over this UIElement right now?
  //Gives 1 extra pixel of padding on each side
  public boolean MouseOver() {
    return mouseX > (x - 1) && mouseX < (x + w + 1) &&
      mouseY > (y - 1) && mouseY < (y + h + 1);
  }
}