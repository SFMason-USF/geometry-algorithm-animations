//Defines a simple rectangular button with customizeable colors and the ability to enable/disable both rendering and visibility
//The text color will render either white or black, depending on the background color
//When rendering is disabled, functionality will automatically be disabled as well
//Sets fill, stroke, font size, rectMode, textAlign when rendering
//To define the functionality of a button, write the code for the functionality in the mouseClicked() function, wrapped in if(buttonInstance.ExecuteClick()){ }
//Example:
/* void mouseClicked(){
 *     if(buttonInstance.ExecuteClick()){
 *         myDesiredButtonFunctionality();
 *     }
 * }
 */
class Button extends UIElement {
  protected Text text;
  protected color idle, hover, clicked;
  protected boolean enabled, visible;

  public Button(int x, int y, int w, int h, String text) {
    this(x, y, w, h, text, color(128), color(120), color(136));
  }

  public Button(int x, int y, int w, int h, String text, color idle, color hover, color clicked) {
    this(x, y, w, h, text, idle, hover, clicked, true, true);
  }

  public Button(int x, int y, int w, int h, String text, color idle, color hover, color clicked, boolean enabled, boolean visible) {
    super(x, y, w, h);
    this.text = new Text(text, x + 1, y + 1, w - 2, h - 2);
    this.idle = idle;
    this.hover = hover;
    this.clicked = clicked;
    this.enabled = enabled;
    this.visible = visible;
  }

  //Get text
  public String Text() {
    return this.text.textContent();
  }

  //Set text
  public String Text(String newText) {
    return this.text.textContent(newText);
  }

  public void Render() {
    int textFill = 0; //Set to contrast with background
    if (visible) {
      if (this.MouseOver()) {
        if (mousePressed) {
          fill(this.clicked);
        } else { 
          fill(this.hover);
        }
      } else {
        fill(this.idle);
      }

      stroke(0);
      rectMode(CORNER);
      rect(x, y, w, h);
      fill(textFill);
      this.text.Render();
    }
  }

  //Return whether or not it's ok to execute the on click code for this button right now
  public boolean ExecuteCLick() {
    return this.enabled && this.visible && this.MouseOver();
  }
}