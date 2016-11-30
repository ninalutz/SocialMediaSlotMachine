void query_twitter(){
  ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("NgUSAWhzcQ5MsnQFLfth1X1mn");
cb.setOAuthConsumerSecret("wxeUCrf2vrSQPcuuSjw0HUKau0kawrpLzR2bZAtjqT7cm1ZbEp");
cb.setOAuthAccessToken("3105596274-5AaNAH588G0AfK8sWTcdzBamKVFA8t2AQ5U7WeJ");
cb.setOAuthAccessTokenSecret("s1Ony5HuHZkfFN4Qd5OSPbKias7iDWNwWDss8Xdtj05g4");
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();

 try { 
    Paging paging = new Paging(1, 100); 
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