public class Level{

  Platform[] levelPlatforms; //An array containing all the platforms in the level.
  
  //The X and Y coordinates of the end goal.
  int endGoalXPos;
  int endGoalYPos;
  
  //The Vector the player starts at on the level. Also doubles as the players' reset point.
  PVector playerStartLocation = new PVector(0, 0);
  
  //Platform constructor. Takes an array of platforms, the X and Y coordinates of the end point and a vector for the start point.
  Level(Platform[] platforms, int goalX, int goalY, PVector playerStart){
  
    levelPlatforms = platforms;
    endGoalXPos = goalX;
    endGoalYPos = goalY;
    playerStartLocation = playerStart;
  
  }
  
  //Draws the components of the level to the screen.
  void DrawLevel(){
  
    //Iterates through each platform and uses their DrawPlatform function.
    for(int i = 0; i < levelPlatforms.length; i++){
    
      levelPlatforms[i].DrawPlatform();
    
    }
    
    //Draws the end goal.
    fill(0, 0, 255);
    rect(endGoalXPos, endGoalYPos, 50, 50);
  
  }
  
  //Checks if the player is in the end zone.
  void ClearZoneCheck(Player player){
  
    //If the player is between the horizontal edges of the end zone...
    if((player.playerPosition.x > endGoalXPos - 25) && (player.playerPosition.x < endGoalXPos + 25)){
    
      //and in between the vertical edges of the end zone...
      if((player.playerPosition.y > endGoalYPos - 25) && (player.playerPosition.y < endGoalYPos + 25)){
      
        //Flag the player as being in the goal.
        playerInGoal = true;
      
      }
    
    }
  
  }

}
