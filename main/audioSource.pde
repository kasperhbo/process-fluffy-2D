import processing.sound.*;
    
class AudioSource{
    String filePath = "";

    SoundFile sound;

    boolean loop = false;

    public AudioSource(PApplet p, String filePath){
        this.filePath = filePath;
        sound = new SoundFile(p, "test");
    }

    public AudioSource(PApplet p, String filePath, boolean looping){
        
        this.filePath = filePath;
        this.loop = looping;        
        sound = new SoundFile(p, "test");
    }

    public void Play(){
        if(this.IsPlaying())
            sound.stop();

        if(this.loop){
            sound.loop();
        }else{
            sound.play();
        }
    }

    public void Stop(){
        sound.stop();
    }

    public boolean IsPlaying(){
        return sound.isPlaying();
    }
}
  
