public abstract class Collider{
    
    protected GameObject parent;
    
    public Collider(GameObject parent)
    {
        this.parent = parent;
    }
    
    public GameObject GetParent(){
      return parent;
    }

    public abstract boolean IsPointInCollider(float px, float py);
    public abstract void Visualize();
}
