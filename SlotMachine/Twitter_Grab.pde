ResponseList<Status> statuses;
String readouttemp = "    ";
void query_twitter(){
  ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("bMIlPcdEIMVA3rM4HwsJDBeJR");
cb.setOAuthConsumerSecret("UsBuiEteRS8GjDaybvWjDjoi2kaOdxPPqtTFZnPAZ8MNVajlPh");
cb.setOAuthAccessToken("3105596274-O6JDvyTNwBaTnJNV4u6xoFIRpBCnk4QenCHazLK");
cb.setOAuthAccessTokenSecret("8e3ZGWEM0vE5ZxQtuLAssaqbX66GRt4lQbrl8xRYReMnP");
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();

 try { 
    Paging paging = new Paging(1, 10); 
    statuses = twitter.getHomeTimeline(paging); 
    String[] input;
    input = "hello there".split(" ");
    for (Status status : statuses) { 
      println(status.getUser().getName() + ":" + status.getText());
       readouttemp = status.getUser().getName() + ":" + status.getText();
       input = status.getText().split(" ");
       merp Merp = new merp(input);
       Network.add(Merp);
    }
  } 
  catch(TwitterException te) { 
    println("Couldn''t connect: " + te);
  }
  analyzing = false;
}