
void query_twitter(){
  ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("rfKF162CbQNzNJuGYmFP47Jn1");
cb.setOAuthConsumerSecret("GXTMXj1zl2KYLrNGlhAzpkVoaP5AjZ0VC1X3N8m3sbEW1zDpUx");
cb.setOAuthAccessToken("3105596274-uwmPZ2dudRlYAFfBEChtuyhSPLerzRfCIEBpd5S");
cb.setOAuthAccessTokenSecret("fyXJaBcdIrD6UAA7kEv2anV05n1Gja5S9OtE4FsrYcy8V");
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();

 try { 
    Paging paging = new Paging(1, 10); 
    ResponseList<Status> statuses = twitter.getHomeTimeline(paging); 
    for (Status status : statuses) { 
      println(status.getUser().getName() + ":" + status.getText());
    }
  } 
  catch(TwitterException te) { 
    println("Couldn''t connect: " + te);
  }
  analyzing = false;
}

