//Defines a text box with automatically resizing text, based on the width of the box (be sure to make the box tall enough)
//Sets font, font size, text align on render
class Text extends UIElement {
  protected String text;

  public Text(String text, int x, int y, int w, int h) {
    super(x, y, w, h);
    this.text = text;
  }

  //get text
  public String textContent() {
    return this.text;
  }

  //set text
  public String textContent(String newText) {
    return this.text = newText;
  }

  public void Render() {
    textAlign(CENTER, CENTER);
    textSize(1);
    float textW = textWidth(this.text);
    textSize(this.w / textW / 2); //TODO: verify this, probably wrong
    text(text, x, y, w, h);
  }
}