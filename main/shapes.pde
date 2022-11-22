public class Shape{
  
    protected Vector4 fillColor;
    public float x;
    public float y;

    public Shape(float startX, float startY){
        this.x = startX;
        this.y = startY;
        this.fillColor = new Vector4();
    }
    
      public Shape(float startX, float startY, Vector4 fillColor){
        this.x = startX;
        this.y = startY;
        this.fillColor = fillColor;
    }

    public void Render(Camera camera){
        fill(fillColor.x * 255, fillColor.y * 255, fillColor.z * 255, fillColor.w * 255);
        this.x = x + camera.transform.position.x;
        this.y = y - camera.transform.position.y;
    }
}

public class Rect extends Shape{

    public float width;
    public float height;

    public Rect(float x, float y, float width, float height)
    {
        super(x, y);
        this.width = width;
        this.height = height;
    }

    public Rect(float startX, float startY, float width, float height, Vector4 fillColor)
    {
        super(startX, startY, fillColor);
        this.width = width;
        this.height = height;
    }

    public void Render(Camera camera){
        super.Render(camera);
        rect(x, y, width, height);
    }
}

public class Circle extends Shape{
    float extent;

    public Circle(float x, float y, float extent)
    {
        super(x,y);
        this.extent = extent;
    }
    
    public Circle(float x, float y, float extent, Vector4 fillColor)
    {
        super(x,y, fillColor);
        this.extent = extent;
    }

    public void Render(Camera camera){
        super.Render(camera);
        circle(x, y, extent);
    }
}
