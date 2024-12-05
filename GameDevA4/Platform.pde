public class Platform{

  int platformXPos;
  int platformYPos;
  int platformWidth;
  int platformHeight;
  
  int platformUpperBound;
  int platformLowerBound;
  int platformLeftBound;
  int platformRightBound;
  
  boolean playerOnMe;
  boolean playerAboveMe;
  boolean playerUnderMe;
  boolean playerOnLeft;
  boolean playerOnRight;
  
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
  
  void CheckForPlayer(Player player){
    
    playerOnMe = false;
    playerAboveMe = false;
    playerUnderMe = false;
    playerOnLeft = false;
    playerOnRight = false;
  
    if(player.playerPosition.x > platformLeftBound && player.playerPosition.x < platformRightBound){
      
      if((player.playerPosition.y - 10) <= platformUpperBound){
      
        playerAboveMe = true;
      
      }else if((player.playerPosition.y + 10) >= platformLowerBound){
      
        playerUnderMe = true;
      
      }
    
      if((player.playerPosition.y + 10) >= platformUpperBound && playerAboveMe){
      
        playerOnMe = true;
        player.playerVelocity.y = 0;
        player.isGrounded = true;
        player.canJump = true;
        player.canDoubleJump = true;
        
      }
      
      if((player.playerPosition.y - 10) <= platformLowerBound && playerUnderMe){
      
        player.playerVelocity.y = 0;
      
      }
      
    }else{
    
      playerOnMe = false;   
    
    }
    
    if((player.playerPosition.x + 10) < platformLeftBound){
      
        playerOnLeft = true;
        println("There is a player on my left.");
        
        if((player.playerPosition.x + 10) >= platformLeftBound && playerOnLeft){
      
          println("Bonk!");
          player.hitWall = true;
      
        }
      
      }else if((player.playerPosition.x - 10) > platformRightBound){
      
        playerOnRight = true;
        println("There is a player on my right.");
        
        if((player.playerPosition.x - 10) <= platformRightBound && playerOnRight){
      
          println("Bonk!");
          player.hitWall = true;
      
        }
      
      } 
  
  }
  
  void DrawPlatform(){
  
    if(playerOnMe){
    
      fill(0, 0, 255);
    
    }else if(playerAboveMe){
    
      fill(0, 255, 0);
    
    }else if(playerUnderMe){
    
      fill(255, 0, 0);
    
    }else if(playerOnLeft){
    
      fill (255, 255, 0);
    
    }else if(playerOnRight){
    
      fill (0, 255, 255);
    
    } else {
    
      fill (128, 128, 128);
    
    }
    
    rect(platformXPos, platformYPos, platformWidth, platformHeight);
  
  }

}
