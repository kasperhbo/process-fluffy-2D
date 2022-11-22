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
}
