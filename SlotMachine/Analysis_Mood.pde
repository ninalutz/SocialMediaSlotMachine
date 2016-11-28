color l1 = color(255, 255, 255);
color l2 = color(255, 255, 255);
color l3 = color(255, 255, 255);

color c1 = color(255, 255, 255);
color c2 = color(255, 255, 255);
color c3 = color(255, 255, 255);

color r1 = color(255, 255, 255);
color r2 = color(255, 255, 255);
color r3 = color(255, 255, 255);

boolean analyzing = true;

void moodcolors(){
  if(millis() % 5 == 0 && analyzing){
    c1 = color(random(255), random(255), random(255));
    c2 = color(random(255), random(255), random(255));
    c3 = color(random(255), random(255), random(255));
    l1 = color(random(255), random(255), random(255));
    l2 = color(random(255), random(255), random(255));
    l3 = color(random(255), random(255), random(255));
    r1 = color(random(255), random(255), random(255));
    r2 = color(random(255), random(255), random(255));
    r3 = color(random(255), random(255), random(255));
  }

}