Level[] levelArray = new Level[4];
int levelSelector = 0;

Player protag;
boolean playerInGoal;
boolean gameStart = false;


void setup(){

  frameRate(100);
  rectMode(CENTER);
  textAlign(CENTER);
  size(800, 600);
  background(0,0,0);
  
  CreateLevel1();
  CreateLevel2();
  CreateLevel3();
  CreateLevel4();
  protag = new Player();
  protag.playerPosition = levelArray[levelSelector].playerStartLocation.copy();
  protag.resetPoint = levelArray[levelSelector].playerStartLocation.copy();

}

void draw(){

  if(gameStart && levelSelector < levelArray.length){
  
    background(0,0,0);
    
    fill(255, 0, 0);
    textSize(16);
  
    if(playerInGoal){
  
    playerInGoal = false;
    levelSelector++;
        
    if(levelSelector < levelArray.length){
          
      protag.playerPosition = levelArray[levelSelector].playerStartLocation.copy();
      protag.resetPoint = levelArray[levelSelector].playerStartLocation.copy();
        
      protag.ResetPlayer();
    
    }
      
  }
  
  if(levelSelector < levelArray.length){
  
    levelArray[levelSelector].DrawLevel();
    protag.PlayerController();  
    levelArray[levelSelector].ClearZoneCheck(protag);
  
  } 
  
  }else if(gameStart && levelSelector == levelArray.length){
  
    textSize(48);
    fill(0, 255, 0);
    text("You did it! \n\n Press space to restart.", 400, 300);
  
  }else if(!gameStart){
  
    background(0,0,0);
    
    textSize(64);
    fill(255, 0, 0);
    text("Platformer I Guess\n\nPress SPACE to start!", 400, 300);
  
  } 

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
  
  if(key == 'r' || key == 'R'){
  
    protag.ResetPlayer();
  
  }
  
  if(key == ' '){
  
    if(!gameStart){
    
      gameStart = true;
    
    }
    
    if(gameStart && levelSelector == levelArray.length){
    
      levelSelector = 0;
      
      protag.playerPosition = levelArray[levelSelector].playerStartLocation.copy();
      protag.resetPoint = levelArray[levelSelector].playerStartLocation.copy();
        
      protag.ResetPlayer();
    
    }
    
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

  Platform plat1 = new Platform(0, 0, 800, 30);
  Platform plat2 = new Platform(675, 570, 125, 30);
  Platform plat3 = new Platform(450, 570, 75, 30);
  Platform plat4 = new Platform(275, 570, 75, 30);
  Platform plat5 = new Platform(75, 570, 75, 30);
  
  Platform plat6 = new Platform(0, 450, 670, 30);
  Platform plat7 = new Platform(670, 115, 30, 365);
  Platform plat8 = new Platform(520, 115, 150, 30);
  Platform plat9 = new Platform(250, 115, 150, 30);
  Platform plat10 = new Platform(0, 115, 150, 30);
  
  Platform[] levelThreePlats = new Platform[10];
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
  
  
  levelArray[1] = new Level(levelThreePlats, 25, 530, new PVector(25, 50));

}

void CreateLevel3(){

  Platform plat1 = new Platform(0, 570, 300, 30);
  Platform plat2 = new Platform(270, 475, 30, 95);
  Platform plat3 = new Platform(300, 475, 500, 30);
  Platform plat4 = new Platform(700, 150, 70, 30);
  Platform plat5 = new Platform(700, 370, 70, 30);
  
  Platform plat6 = new Platform(500, 85, 200, 30);
  Platform plat7 = new Platform(500, 115, 30, 285);
  Platform plat8 = new Platform(530, 175, 100, 30);
  Platform plat9 = new Platform(530, 275, 100, 30);
  
  Platform plat10 = new Platform(0, 450, 150, 30);
  Platform plat11 = new Platform(150, 115, 30, 365);
  Platform plat12 = new Platform(180, 375, 190, 30);
  Platform plat13 = new Platform(180, 115, 220, 30);
  Platform plat14 = new Platform(370, 200, 30, 205);
  
  Platform[] levelFourPlats = new Platform[14];
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
  
  levelArray[2] = new Level(levelFourPlats, 240, 230, new PVector(30, 540));

}

void CreateLevel4(){

  Platform plat1 = new Platform(0, 170, 200, 30);
  Platform[] levelFivePlats = new Platform[1];
  
  levelFivePlats[0] = plat1;
  
  levelArray[3] = new Level(levelFivePlats, 650, 500, new PVector(30, 100));

}
