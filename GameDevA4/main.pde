Level[] levelArray = new Level[5];
int levelSelector = 0;

Player protag;

void setup(){

  rectMode(CENTER);
  size(800, 600);
  background(0,0,0);
  
  CreateLevel1();
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

void CreateLevel1(){

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
  
  
  levelArray[0] = new Level(testLevelPlats, 775, 100, new PVector(25, 425));

}

void CreateLevel2(){

  Platform plat1 = new Platform(285, 115, 250, 30);
  Platform plat2 = new Platform(500, 200, 150, 30);
  Platform plat3 = new Platform(0, 400, 150, 30);
  Platform plat4 = new Platform(0, 500, 150, 30);
  
  Platform[] levelTwoPlats = new Platform[4];
  levelTwoPlats[0] = plat1;
  levelTwoPlats[1] = plat2;
  levelTwoPlats[2] = plat3;
  levelTwoPlats[3] = plat4;
  
  
  levelArray[1] = new Level(levelTwoPlats, 25, 450, new PVector(25, 425));

}

void CreateLevel3(){

  Platform plat1 = new Platform(0, 0, 800, 30);
  Platform plat2 = new Platform(770, 0, 30, 600);
  Platform plat3 = new Platform(675, 570, 125, 30);
  Platform plat4 = new Platform(450, 570, 75, 30);
  Platform plat5 = new Platform(275, 570, 75, 30);
  Platform plat6 = new Platform(75, 570, 75, 30);
  Platform plat7 = new Platform(0, 450, 700, 30);
  Platform plat8 = new Platform(670, 115, 30, 585);
  Platform plat9 = new Platform(590, 115, 70, 30);
  Platform plat10 = new Platform(275, 115, 70, 30);
  Platform plat11 = new Platform(0, 115, 70, 30);
  
  Platform[] levelThreePlats = new Platform[11];
  levelThreePlats[0] = plat1;
  levelThreePlats[1] = plat2;
  levelThreePlats[2] = plat3;
  levelThreePlats[3] = plat4;
  levelThreePlats[4] = plat5;
  levelThreePlats[5] = plat6;
  levelThreePlats[6] = plat7;
  levelThreePlats[7] = plat8;
  levelThreePlats[8] = plat9;
  levelThreePlats[9] = plat10;
  levelThreePlats[10] = plat11;
  
  
  levelArray[2] = new Level(levelThreePlats, 25, 530, new PVector(25, 50));

}

void CreateLevel4(){

  Platform plat1 = new Platform(0, 570, 300, 30);
  Platform plat2 = new Platform(270, 475, 125, 30);
  Platform plat3 = new Platform(300, 475, 500, 30);
  Platform plat4 = new Platform(770, 0, 475, 30);
  Platform plat5 = new Platform(700, 150, 70, 30);
  Platform plat6 = new Platform(700, 370, 70, 30);
  
  Platform plat7 = new Platform(500, 85, 200, 30);
  Platform plat8 = new Platform(500, 115, 30, 285);
  Platform plat9 = new Platform(530, 175, 100, 30);
  Platform plat10 = new Platform(530, 275, 100, 30);
  
  Platform plat11 = new Platform(0, 450, 150, 30);
  Platform plat12 = new Platform(150, 150, 30, 300);
  Platform plat13 = new Platform(180, 375, 190, 30);
  Platform plat14 = new Platform(180, 115, 190, 30);
  Platform plat15 = new Platform(370, 0, 30, 250);
  Platform plat16 = new Platform(370, 280, 30, 120);
  
  Platform[] levelFourPlats = new Platform[16];
  levelFourPlats[0] = plat1;
  levelFourPlats[1] = plat2;
  levelFourPlats[2] = plat3;
  levelFourPlats[3] = plat4;
  levelFourPlats[4] = plat5;
  levelFourPlats[5] = plat6;
  levelFourPlats[6] = plat7;
  levelFourPlats[7] = plat8;
  levelFourPlats[8] = plat9;
  levelFourPlats[9] = plat10;
  levelFourPlats[10] = plat11;
  levelFourPlats[11] = plat12;
  levelFourPlats[12] = plat13;
  levelFourPlats[13] = plat14;
  levelFourPlats[14] = plat15;
  levelFourPlats[15] = plat16;
  
  levelArray[3] = new Level(levelFourPlats, 240, 215, new PVector(30, 540));

}

void CreateLevel5(){

  Platform plat1 = new Platform(0, 170, 200, 30);
  Platform[] levelFivePlats = new Platform[1];
  
  levelFivePlats[0] = plat1;
  
  levelArray[4] = new Level(levelFivePlats, 650, 500, new PVector(30, 100));

}
