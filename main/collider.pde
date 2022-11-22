public abstract class Collider{
    
    protected GameObject parent;
    
    public Collider(GameObject parent)
    {
        this.parent = parent;
    }

    public abstract boolean IsPointInCollider(float px, float py);
}
