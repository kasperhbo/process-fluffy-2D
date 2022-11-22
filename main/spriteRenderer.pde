public class SpriteRenderer extends Component{  
    PImage image = null;  
    
    public SpriteRenderer(String filePath)
    {
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
        image(image, gameObject.renderTransform.position.x, gameObject.renderTransform.position.y, gameObject.transform.scale.x, gameObject.transform.scale.y);
    }
}
