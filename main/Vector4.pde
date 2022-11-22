class Vector4{
    public float x;
    public float y;
    public float z;
    public float w;

    public Vector4(){
        this.x = 0;
        this.y = 0;
        this.z = 0;
        this.w = 0;
    }

    public Vector4(float x){
        this.x = x;
        this.y = 0;
        this.z = 0;
        this.w = 0;
    }

    public Vector4(float x, float y){
        this.x = x;
        this.y = y;
        this.z = 0;
        this.w = 0;
    }

    public Vector4(float x, float y, float z){
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = 0;
    }

    public Vector4(float x, float y, float z, float w){
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

}
