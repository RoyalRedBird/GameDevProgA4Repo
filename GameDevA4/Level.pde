public class Level{

  Platform[] levelPlatforms;
  
  int endGoalXPos;
  int endGoalYPos;
  
  PVector playerStartLocation = new PVector(0, 0);
  
  Level(Platform[] platforms, int goalX, int goalY, PVector playerStart){
  
    levelPlatforms = platforms;
    endGoalXPos = goalX;
    endGoalYPos = goalY;
    playerStartLocation = playerStart;
  
  }
  
  void DrawLevel(){
  
    for(int i = 0; i < levelPlatforms.length; i++){
    
      levelPlatforms[i].DrawPlatform();
    
    }
    
    fill(0, 0, 255);
    rect(endGoalXPos, endGoalYPos, 50, 50);
  
  }
  
  void ClearZoneCheck(Player player){
  
    if((player.playerPosition.x > endGoalXPos - 25) && (player.playerPosition.x < endGoalXPos + 25)){
    
      if((player.playerPosition.y > endGoalYPos - 25) && (player.playerPosition.y < endGoalYPos + 25)){
      
        playerInGoal = true;
      
      }
    
    }
  
  }

}
