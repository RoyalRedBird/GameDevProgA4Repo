public class Level{

  Platform[] levelPlatforms;
  
  int endGoalXPos;
  int endGoalYPos;
  
  Level(Platform[] platforms, int goalX, int goalY){
  
    levelPlatforms = platforms;
    endGoalXPos = goalX;
    endGoalYPos = goalY;
  
  }
  
  void DrawLevel(){
  
    for(int i = 0; i < levelPlatforms.length; i++){
    
      levelPlatforms[i].DrawPlatform();
    
    }
    
    fill(0, 0, 255);
    rect(endGoalXPos, endGoalYPos, 50, 50);
  
  }

}
