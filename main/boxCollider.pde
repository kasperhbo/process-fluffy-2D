public class BoxCollider extends Collider{
  
    public BoxCollider()
    {
        super();
    }
    
    @Override
    public void Init(GameObject parent){
      super.Init(parent);
    }
    
    public boolean IsPointInCollider(float px, float py){
        float rx = parent.transform.position.x;
        float ry = parent.transform.position.y;
        float rw = parent.transform.scale.x;
        float rh = parent.transform.scale.y;
        return px >= rx && px <= rx + rw && py >= ry && py <= ry + rh;
    }
    
    public boolean BoxInBox(BoxCollider otherBox){
        float box1X = parent.transform.position.x;
        float box1Y = parent.transform.position.y;
        float box1W = parent.transform.scale.x;
        float box1H = parent.transform.scale.y;
        
        float box2X = otherBox.parent.transform.position.x;
        float box2Y = otherBox.parent.transform.position.y;
        float box2W = otherBox.parent.transform.position.x;
        float box2H = otherBox.parent.transform.position.y;
        
        return(box1X < box2X + box2W &&
        box1X + box1W > box2X &&
        box1Y < box2Y + box2H &&
        box1Y + box1H > box2Y);
    }   
    
    public void Visualize(){
      /**
       * Points and Lines. 
       * 
       * Points and lines can be used to draw basic geometry.
       * Change the value of the variable 'd' to scale the form.
       * The four variables set the positions based on the value of 'd'. 
       */      
       rect(parent.transform.position.x, parent.transform.position.y, parent.transform.scale.x, parent.transform.scale.y);      
    }
}
