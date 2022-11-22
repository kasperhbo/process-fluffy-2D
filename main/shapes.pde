public abstract class Shape extends Component{  
    protected Vector4 fillColor;
    public float x;
    public float y;

    public Shape(GameObject go, float startX, float startY){
        super(go);
        this.x = startX;
        this.y = startY; 
        this.fillColor = new Vector4();
    }
    
    public Shape(GameObject go, float startX, float startY, Vector4 fillColor){
        super(go);
        this.x = startX;
        this.y = startY;
        this.fillColor = fillColor;
    }    
    
     public void Render(Camera camera){
        
       fill(fillColor.x * 255, fillColor.y * 255, fillColor.z * 255, fillColor.w * 255);
        
        this.x = x + camera.transform.position.x;
        this.y = y - camera.transform.position.y;
        
        noFill();
    }
     
    public abstract void FixedUpdate(float dt);
    public abstract void Update(float dt);
}

public class Rect extends Shape{
  
    public float width;
    public float height;

    public Rect(GameObject go)
    {
        super(go, go.transform.position.x, go.transform.position.y);
        this.width = go.transform.scale.x;
        this.height = go.transform.scale.y;
    }

    public Rect(GameObject go, Vector4 fillColor)
    {
        super(go, go.transform.position.x, go.transform.position.y, fillColor);
        this.width = go.transform.scale.x;
        this.height = go.transform.scale.y;
    }

    public void Render(Camera camera){
        super.Render(camera);
        rect(x, y, width, height);
    }
    
    public void FixedUpdate(float dt){}
    public void Update(float dt){}
}

public class Circle extends Shape{
    float extent;

    public Circle(GameObject go, float x, float y, float extent)
    {
        super(go, x,y);
        this.extent = extent;
    }
    
    public Circle(GameObject go,float x, float y, float extent, Vector4 fillColor)
    {
        super(go, x, y, fillColor);
        this.extent = extent;
    }

    public void Render(Camera camera){
        super.Render(camera);
        circle(x, y, extent);
    }
    
    public void FixedUpdate(float dt){}
    public void Update(float dt){}
}
