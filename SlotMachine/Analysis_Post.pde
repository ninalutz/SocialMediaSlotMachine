ArrayList<merp> Network = new ArrayList<merp>();
int emotion_joy, emotion_anger, emotion_anticipation, emotion_fear, emotion_trust, emotion_surprise, emotion_saddness, emotion_disgust;

processing.data.JSONObject json;

public class merp {
  public String [] words;
  public int _joy, _anger, _anticipation, _fear, _trust, _surprise, _saddness, _disgust;
  merp(String[] _words){
  words = _words;
  }
}


void init_Lexicon_Map(){
json = loadJSONObject("data/words.json");

println(json.getJSONObject("skilled"));
println(json.getJSONObject("skilled").getInt("joy"));
}

void analyze_Network(){
  json = loadJSONObject("data/words.json");

  String[] test;
  for(int i = 0; i<Network.size(); i++){
     for (int j = 0; j<Network.get(i).words.length; j++){
       try{
         json.getJSONObject(Network.get(i).words[j]);
         
         Network.get(i)._joy+=json.getJSONObject(Network.get(i).words[j]).getInt("joy");
         emotion_joy += json.getJSONObject(Network.get(i).words[j]).getInt("joy");
         
         Network.get(i)._anger+=json.getJSONObject(Network.get(i).words[j]).getInt("anger");
         emotion_anger += json.getJSONObject(Network.get(i).words[j]).getInt("anger");
         
         Network.get(i)._anger+=json.getJSONObject(Network.get(i).words[j]).getInt("anger");
         emotion_anger += json.getJSONObject(Network.get(i).words[j]).getInt("anger");
       }
       catch(Exception e){}

     }
  }
  
  println(emotion_joy, emotion_anger);
  
}
