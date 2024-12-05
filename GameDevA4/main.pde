Level testLevel;
Player protag;

void setup(){

  rectMode(CENTER);
  size(800, 600);
  background(0,0,0);
  
  Platform plat1 = new Platform(400, 400, 200, 50);
  Platform plat2 = new Platform(100, 400, 100, 600);
  Platform plat3 = new Platform(700, 400, 100, 600);
  
  Platform[] testLevelPlats = new Platform[3];
  testLevelPlats[0] = plat1;
  testLevelPlats[1] = plat2;
  testLevelPlats[2] = plat3;
  
  
  testLevel = new Level(testLevelPlats, 400, 50);
  protag = new Player();
  protag.playerPosition.x = 400;
  protag.playerPosition.y = 300;

}

void draw(){

  background(0,0,0);
  
  testLevel.DrawLevel();
  protag.PlayerController();
  

}

void keyPressed(){

  if(keyCode == RIGHT){
  
    protag.goingRight = true;
  
  }
  
  if(keyCode == LEFT){
  
    protag.goingLeft = true;
  
  }
  
  if(keyCode == UP){
  
    protag.PlayerJump();
  
  }

}

void keyReleased(){

  if(keyCode == RIGHT){
  
    protag.goingRight = false;
  
  }
  
  if(keyCode == LEFT){
  
    protag.goingLeft = false;
  
  }

}
