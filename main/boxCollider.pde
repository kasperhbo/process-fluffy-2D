public class BoxCollider extends Collider{
  
    public BoxCollider(GameObject parent)
    {
        super(parent);
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
      fill(#20FA00, .2f);
      
      Rect sh = new Rect(parent, new Vector4(0,1,0,.2));
      parent.AddComponent(sh);
      
     fill(1,1,1,1);
    }
}

public static class Collision{  
    public static boolean AABB(BoxCollider b1, BoxCollider b2){
        float box1X = b1.parent.transform.position.x;
        float box1Y = b1.parent.transform.position.y;
        float box1W = b1.parent.transform.scale.x;
        float box1H = b1.parent.transform.scale.y;
        
        float box2X = b2.parent.transform.position.x;
        float box2Y = b2.parent.transform.position.y;
        float box2W = b2.parent.transform.position.x;
        float box2H = b2.parent.transform.position.y;
        
        return(box1X < box2X + box2W &&
        box1X + box1W > box2X &&
        box1Y < box2Y + box2H &&
        box1Y + box1H > box2Y);
    }
    
    public static boolean PointInBox(float px, float py, BoxCollider b1){
        float rx = b1.parent.transform.position.x;
        float ry = b1.parent.transform.position.y;
        float rw = b1.parent.transform.scale.x;
        float rh = b1.parent.transform.scale.y;
        return px >= rx && px <= rx + rw && py >= ry && py <= ry + rh;
    }   
}
