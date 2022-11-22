public class SpriteRenderer extends Component{

    PImage image = null;  
    
    public SpriteRenderer(String filePath)
    {
      super();
      image = loadImage(filePath);
    }
    
    @Override
    public void Init(GameObject go)
    {
      super.Init(go);
    }
    
    @Override
    public void FixedUpdate(float dt) {
    }
    
    @Override
    public void Render(Camera cam){
        image(image, gameObject.transform.position.x, gameObject.transform.position.y, gameObject.transform.scale.x, gameObject.transform.scale.y);
    }
}
