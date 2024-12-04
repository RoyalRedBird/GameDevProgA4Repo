public class Platform{

  int platformXPos;
  int platformYPos;
  int platformWidth;
  int platformHeight;
  
  int platformUpperBound;
  int platformLowerBound;
  int platformLeftBound;
  int platformRightBound;
  
  Platform(int xPos, int yPos, int pWidth, int pHeight){
  
    platformXPos = xPos;
    platformYPos = yPos;
    platformWidth = pWidth;
    platformHeight = pHeight;
    
    platformUpperBound = platformYPos - (platformHeight/2);
    platformLowerBound = platformYPos + (platformHeight/2);
    
    platformLeftBound = platformXPos - (platformWidth/2);
    platformRightBound = platformXPos + (platformWidth/2);
    
  }
  
  int getPlatformTop(){
  
    return platformUpperBound;
  
  }
  
  int getPlatformBottom(){
  
    return platformLowerBound;
  
  }
  
  int getPlatformLeft(){
  
    return platformLeftBound;
  
  }
  
  int getPlatformRight(){
  
    return platformRightBound;
  
  }
  
  void DrawPlatform(){
  
    fill (128, 128, 128);
    rect(platformXPos, platformYPos, platformWidth, platformHeight);
  
  }

}
