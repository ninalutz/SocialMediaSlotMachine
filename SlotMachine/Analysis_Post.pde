ArrayList<merp> Network = new ArrayList<merp>();
int emotion_joy, emotion_anger, emotion_anticipation, emotion_fear, emotion_trust, emotion_surprise, emotion_saddness, emotion_disgust;

public class merp {
  public String [] words;
  public int _joy, _anger, _anticipation, _fear, _trust, _surprise, _saddness, _disgust;
  merp(String[] _words){
  words = _words;
  }
}

void analyze_Network(){
  String[] test;
  for(int i = 0; i<Network.size(); i++){
     for (int j = 0; j<Network.get(i).words.length; j++){
       //println(Network.get(i).words[j]);
       //println(Network.get(i)._joy);
     }
  }

}