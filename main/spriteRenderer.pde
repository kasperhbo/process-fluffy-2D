public class SpriteRenderer extends Component{

    PImage image = null;  
    
    public SpriteRenderer(GameObject go, String filePath)
    {
      super(go);
      image = loadImage(filePath);
    }
    
    @Override
    public void FixedUpdate(float dt) {
    }
    
    @Override
    public void Update(float dt) {
      
    }
    
    @Override
    public void Render(Camera cam){
        image(image, gameObject.transform.position.x, gameObject.transform.position.y, gameObject.transform.scale.x, gameObject.transform.scale.y);
    }
}
