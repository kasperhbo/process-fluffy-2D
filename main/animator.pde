public class Animator extends Component{

    PImage[] images;

    int imageCount;
    int frame;

    Animator(String[] imagesToLoad) {
        images = new PImage[imagesToLoad.length];
        
        for (int i = 0; i < imagesToLoad.length; ++i) {
            images[i] = loadImage(imagesToLoad[i]);
        }
    }
    
    public void FixedUpdate(float dt){}
    public void Update(float dt){}

    @Override
    public void Render(Camera cam){
        frame = (frame+1) % imageCount;
        image(images[frame],  gameObject.renderTransform.position.x, gameObject.renderTransform.position.y);        
    }
}