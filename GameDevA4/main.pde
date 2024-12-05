Level[] levelArray = new Level[5];
int levelSelector = 0;

Player protag;

void setup(){

  rectMode(CENTER);
  size(800, 600);
  background(0,0,0);
  
  Platform plat1 = new Platform(0, 500, 250, 30);
  Platform plat2 = new Platform(300, 425, 150, 30);
  Platform plat3 = new Platform(500, 350, 150, 30);
  Platform plat4 = new Platform(300, 275, 150, 30);
  Platform plat5 = new Platform(0, 200, 250, 30);
  Platform plat6 = new Platform(300, 125, 150, 30);
  Platform plat7 = new Platform(700, 125, 150, 30);
  
  Platform[] testLevelPlats = new Platform[7];
  testLevelPlats[0] = plat1;
  testLevelPlats[1] = plat2;
  testLevelPlats[2] = plat3;
  testLevelPlats[3] = plat4;
  testLevelPlats[4] = plat5;
  testLevelPlats[5] = plat6;
  testLevelPlats[6] = plat7;
  
  
  levelArray[0] = new Level(testLevelPlats, 400, 50, new PVector(25, 425));
  protag = new Player();
  protag.playerPosition = levelArray[levelSelector].playerStartLocation.copy();
  protag.resetPoint = levelArray[levelSelector].playerStartLocation.copy();

}

void draw(){

  background(0,0,0);
  
  levelArray[levelSelector].DrawLevel();
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
