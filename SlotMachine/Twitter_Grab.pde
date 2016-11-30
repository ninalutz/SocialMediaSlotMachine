void init_Twitter(){
ConfigurationBuilder cb = new ConfigurationBuilder();

cb.setOAuthConsumerKey("rfKF162CbQNzNJuGYmFP47Jn1");
cb.setOAuthConsumerSecret("GXTMXj1zl2KYLrNGlhAzpkVoaP5AjZ0VC1X3N8m3sbEW1zDpUx");
cb.setOAuthAccessToken("3105596274-uwmPZ2dudRlYAFfBEChtuyhSPLerzRfCIEBpd5S");
cb.setOAuthAccessTokenSecret("fyXJaBcdIrD6UAA7kEv2anV05n1Gja5S9OtE4FsrYcy8V");

Twitter twitter = new TwitterFactory(cb.build()).getInstance();


Query query = new Query("#OWS");
 
try {
  QueryResult result = twitter.search(query);
  println(result);
}
catch (TwitterException te) {
  println("Couldn't connect: " + te);
};

}

void query_Twitter(){
  
}
