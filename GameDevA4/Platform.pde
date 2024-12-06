//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa
//I HATE MAKING HITBOXES FROM SCRATCH AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

public class Platform{

  //The X Position, Y Position, Width and Height of the platform.
  int platformXPos;
  int platformYPos;
  int platformWidth;
  int platformHeight;
  
  //The respective coordinates for the upper, lower and side edges of the platform.
  int platformUpperBound;
  int platformLowerBound;
  int platformLeftBound;
  int platformRightBound;
  
  //These booleans exist to track where the player is relative to itself.
  boolean playerOnMe;
  boolean playerAboveMe;
  boolean playerUnderMe;
  boolean playerOnLeft;
  boolean playerOnRight;
  
  //Platform constructor.
  Platform(int xPos, int yPos, int pWidth, int pHeight){
  
    //The platform constructor takes the X and Y coordinates and shuffles them to the center of the platform
    //this is done to make placing the platforms easier as feeding the constructor coordinates works just like
    //the rect function with the rectMode set to CENTER>
    platformXPos = xPos + (pWidth/2);
    platformYPos = yPos + (pHeight/2);
    platformWidth = pWidth;
    platformHeight = pHeight;
    
    //The bounds of the platform are calculated with the information fed to it.
    platformUpperBound = platformYPos - (platformHeight/2);
    platformLowerBound = platformYPos + (platformHeight/2);
    
    platformLeftBound = platformXPos - (platformWidth/2);
    platformRightBound = platformXPos + (platformWidth/2);
    
  }
  
  //OHGOD OHNO OHGOD OHNO OHGOD OHNO OHGOD OHNO OHGOD OHNO OHGOD OHNO OHGOD OHNO
  //This function compares the location to itself and handles the player's
  //physics and location depending on where the character is.
  void CheckForPlayer(Player player){
    
    //Resets each of the player position flags before running any checks.
    //Bad things happen if you don't. (The player getting frozen in place for example.)
    playerOnMe = false;
    playerAboveMe = false;
    playerUnderMe = false;
    playerOnLeft = false;
    playerOnRight = false;
  
    //If the player is between the left and right bounds of the platform...
    if((player.playerPosition.x + 10) > platformLeftBound && (player.playerPosition.x - 10) < platformRightBound){
      
      //And is above the platform's upper bound...
      if((player.playerPosition.y + 10) <= platformUpperBound){
      
         //Flag the player as being above the platform.
         playerAboveMe = true;
      
         //If the player is underneath the lower bound...
         }else if((player.playerPosition.y - 10) >= platformYPos){
      
         //Flag the player as beng beneath the platform. 
         playerUnderMe = true;
      
      }        
      
      
      //If the player was flagged as being under the platform and
      //the top of the player goes above the lower bound of the platform...
      if((((player.playerPosition.y + player.playerVelocity.y) - 10) <= platformLowerBound) && playerUnderMe){
      
        //They have hit the bottom of the platform.
        //Cease all vertical momentum and reset player position to right below the platform.
        player.playerVelocity.y = 0;
        player.playerPosition.y = platformLowerBound + 10;
      
      }
      
    }
    
    //If the player was above the platform and
    //the bottom of the player goes beneath the upper bound of the platform...
    if((player.playerPosition.y + player.playerVelocity.y + 10) >= platformUpperBound && playerAboveMe){
      
          //They have landed on the platform.
          
          //Flag this platform as having the player on it.
          playerOnMe = true;
          
          //Cease vertical momentum and reset the player to right above the platform.
          player.playerVelocity.y = 0;
          player.playerPosition.y = platformUpperBound - 10;
          
          //Flag the player as being on the ground.
          player.isGrounded = true;
          
          //Reset the jump and double jump flags to true.
          player.canJump = true;
          player.canDoubleJump = true;
        
    }
    
    //If the right of the player is to the left of the platform's left bound
    //and if the player is neither on, above or below the platform...
    if(((player.playerPosition.x + 10) < platformXPos) && (!playerOnMe && !playerAboveMe && !playerUnderMe)){
      
        //Flag the player as being on the left of the platform.
        playerOnLeft = true;
        
        //If the right of the player is to the right of the left bound of the platform
        //and if the player was on the left...
        if((player.playerPosition.x + 10) >= platformLeftBound && playerOnLeft){
          
          //If the player is between the top and bottom bounds of the platform...
          if(((player.playerPosition.y + 10) >= platformUpperBound) && ((player.playerPosition.y - 10) <= platformLowerBound)){
            
            //If the player was neither above or below the platform.
            if(!playerAboveMe && !playerUnderMe){
            
              //Cease all horizontal momentum.
              player.playerPosition.x = (platformLeftBound - 10);
            
            }
               
          }         
     
        }
      
      }
          
      //If the left of the player is to the right of the platform's right bound
      //and if the player is neither on, above or below the platform...
      if(((player.playerPosition.x - 10) > platformXPos) && (!playerOnMe && !playerAboveMe && !playerUnderMe)){
      
        //Flag the player as being on the right of the platform.
        playerOnRight = true;
        
        //If the left of the player is to the left of the right bound of the platform
        //and if the player was on the right...
        if((player.playerPosition.x - 10) <= platformRightBound && playerOnRight){
      
          //If the player is between the top and bottom bounds of the platform...
          if(((player.playerPosition.y + 10) >= platformUpperBound) && ((player.playerPosition.y - 10) <= platformLowerBound)){
          
            //If the player was neither above or below the platform.
            if(!playerAboveMe && !playerUnderMe){

              //Cease all horizontal momentum.
              player.playerPosition.x = (platformRightBound + 10); 
            
            }
                                        
          }
               
        }
      
     }
  
  }
  
  //Draws this platform to the screen.
  void DrawPlatform(){
  
    //This if/else if chain changes the color of the platform depending on where the player is in relation to the platform.
    
    //This was originally a debug feature but since it looks cool enough, I left it in.
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
    
    //Draw the rect for the platform.
    rect(platformXPos, platformYPos, platformWidth, platformHeight);
  
  }

}
