Level[] levelArray = new Level[4]; //An array of level objects.
int levelSelector = 0; //The current level being loaded and played.

Player protag; //The player character.
boolean playerInGoal; //Flags if the player is in the end goal of the level.
boolean gameStart = false; //Tracks if the game is in the playing state.


void setup(){

  frameRate(100);
  rectMode(CENTER);
  textAlign(CENTER);
  size(800, 600);
  background(0,0,0);
  
  //The four levels are initialized in their own methods and loaded into the level array.
  CreateLevel1();
  CreateLevel2();
  CreateLevel3();
  CreateLevel4();
  protag = new Player(); //The player is initialized.
  
  //The players position and their reset point is overridden by the start point of the level.
  protag.playerPosition = levelArray[levelSelector].playerStartLocation.copy();
  protag.resetPoint = levelArray[levelSelector].playerStartLocation.copy();

}

void draw(){

  //If the game has started and the tracker hasn't reached the end of the array.
  if(gameStart && levelSelector < levelArray.length){
  
    background(0,0,0);
  
    //If the player is in the level goal.
    if(playerInGoal){
  
      //Set the flag to false and increment to the next level.
      playerInGoal = false;
      levelSelector++;
        
      //If we have yet to reach the end of the level array. 
      if(levelSelector < levelArray.length){
          
        //Reset the player when the level loads.
        protag.playerPosition = levelArray[levelSelector].playerStartLocation.copy();
        protag.resetPoint = levelArray[levelSelector].playerStartLocation.copy();
        
        protag.ResetPlayer();
    
      }
      
    }
  
  //If we have yet to reach the end of the level array. 
  if(levelSelector < levelArray.length){
  
    //Draw the next level, manage the player and check if the player is in the end zone.
    levelArray[levelSelector].DrawLevel();
    protag.PlayerController();  
    levelArray[levelSelector].ClearZoneCheck(protag);
  
  } 
  
  //If gameStart is true but the levelSelector has reached the end of the array.
  }else if(gameStart && levelSelector == levelArray.length){
  
    //Display congratulations text and offer a restart.
    textSize(48);
    fill(0, 255, 0);
    text("You did it! \n\n Press space to restart.", 400, 300);
  
  //If the game hasn't started.
  }else if(!gameStart){
  
    background(0,0,0);
    
    //Display start text.
    textSize(64);
    fill(255, 0, 0);
    text("Platformer I Guess\n\nPress SPACE to start!", 400, 300);
  
  } 

}

//KeyPressed flags movement booleans in the Player class
//In addition, it handles player resetting and starting/restarting the game.
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
  
  //On hit space...
  if(key == ' '){
  
    //Start the game if it hasn't started.
    if(!gameStart){
    
      gameStart = true;
    
    }
    
    //Restart the game if the game has ended.
    if(gameStart && levelSelector == levelArray.length){
    
      levelSelector = 0;
      
      protag.playerPosition = levelArray[levelSelector].playerStartLocation.copy();
      protag.resetPoint = levelArray[levelSelector].playerStartLocation.copy();
        
      protag.ResetPlayer();
    
    }
    
  }

}

//The keyReleased method is here to make sure the player can actually stop going left or right.
void keyReleased(){

  if(keyCode == RIGHT){
  
    protag.goingRight = false;
  
  }
  
  if(keyCode == LEFT){
  
    protag.goingLeft = false;
  
  }

}

//Comments will only be written for the first level method.
void CreateLevel1(){

  //Each platform is instantiated manually. 
  Platform plat1 = new Platform(0, 500, 250, 30);
  Platform plat2 = new Platform(300, 425, 150, 30);
  Platform plat3 = new Platform(500, 350, 150, 30);
  Platform plat4 = new Platform(300, 275, 150, 30);
  Platform plat5 = new Platform(0, 200, 250, 30);
  Platform plat6 = new Platform(300, 125, 150, 30);
  Platform plat7 = new Platform(700, 125, 150, 30);
  
  //The platform array for the level is initialized and each platform is loaded manually.
  Platform[] testLevelPlats = new Platform[7];
  testLevelPlats[0] = plat1;
  testLevelPlats[1] = plat2;
  testLevelPlats[2] = plat3;
  testLevelPlats[3] = plat4;
  testLevelPlats[4] = plat5;
  testLevelPlats[5] = plat6;
  testLevelPlats[6] = plat7;
  
  //Assigns the level to its spot in the level array.
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
