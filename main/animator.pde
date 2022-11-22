public class Animator extends Component{

    PImage[] images;

    int imageCount;
    int frame;

    Animator(String[] imagesToLoad) {
        super();
        images = new PImage[imagesToLoad.length];
        
        for (int i = 0; i < imagesToLoad.length; ++i) {
            images[i] = loadImage(imagesToLoad[i]);
        }
    }
    
    @Override
    public void Init(GameObject go){
        super.Init(go);
    }
    
    public void FixedUpdate(float dt){}

    @Override
    public void Render(Camera cam){
        frame = (frame+1) % imageCount;
        image(images[frame], gameObject.transform.position.x, gameObject.transform.position.y, gameObject.transform.scale.x, gameObject.transform.scale.y);
    }
}
