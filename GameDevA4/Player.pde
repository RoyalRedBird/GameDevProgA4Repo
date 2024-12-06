public class Player{

  PVector playerPosition = new PVector(0, 0); //Player position.
  PVector playerVelocity = new PVector(0, 0); //Player velocity.
  PVector resetPoint = new PVector(0, 0); //Where the player spawns/is reset.
  
  float gravityForce = 0.2; //Force of gravity for the game.
  
  boolean canJump = false; //Can I jump?
  boolean canDoubleJump = false; //Can I double jump?
  
  //Can I go right or left?
  boolean goingRight = false;
  boolean goingLeft = false;
  
  boolean isGrounded = false; //Am I on a platform?
  
  //Runs all the functions that makes the player work.
  void PlayerController(){
  
    DrawPlayer();
    PlayerPhysicsHandler();
    PlayerCollisionChecker();
    PlayerBoundsChecker();
    
  }
  
  //Checks if the player is within the bounds of the game window.
  //Resets the player if you fall through the floor or go off the left/right side of the window.
  void PlayerBoundsChecker(){
  
    if(playerPosition.x <= 0 || playerPosition.x >= width){
    
      ResetPlayer();
    
    }
    
    if(playerPosition.y > height){
    
      ResetPlayer();
    
    }
  
  }
  
  //Handles player physics.
  void PlayerPhysicsHandler(){
  
    playerVelocity.y += gravityForce; //Constaly applies gravity to the player velocity.
    
    //If the going right bool is true.
    if(goingRight){
      
      //Apply rightward force.
      playerVelocity.x = 3;
            
    //If the going left bool is true.
    }else if(goingLeft){
    
      //Apply leftward force.
      playerVelocity.x = -3;
            
    }else{
    
      //Stay still if neither going left or right.
      playerVelocity.x = 0;
    
    }
    
    //If the player is going up.
    if(playerVelocity.y < 0){
    
      //Then they aren't grounded.
      isGrounded = false;
    
    }
    
    //If the player is grounded...
    if(isGrounded){
    
      //They won't fall.
      playerVelocity.y = 0;
      
    }
    
    //Add player velocity to the player location.
    playerPosition.add(playerVelocity);
    
  }
  
  //Handles player jumping.
  void PlayerJump(){
  
    //If the player can jump.
    if(canJump){
        
        isGrounded = false; //They are no longer grounded.
        playerVelocity.y = 0; //Cease all vertical momentum.
        playerVelocity.y += -5; //Then add the jump force to the player.
        canJump = false;  //They can no longer jump.
    
      //If the player can double jump.
      }else if(canDoubleJump){
        
        //Same as before but you can't double jump until you hit the floor.
        isGrounded = false;
        playerVelocity.y = 0;
        playerVelocity.y += -5;
        canDoubleJump = false;
        
      }
  
  }
  
  //Draws the player.
  void DrawPlayer(){
  
    fill(0, 255, 0);
    rect(playerPosition.x, playerPosition.y, 20, 20);
    
  }
  
  //Handles player collision with platforms.
  void PlayerCollisionChecker(){
    
    boolean playerOnSomething = false; //Internal flag to check if the player is on a platform.

    //Iterate through every platform in the level.
    for(int i = 0; i < levelArray[levelSelector].levelPlatforms.length; i++){
    
      //Check each platform's location relative to the player.
      levelArray[levelSelector].levelPlatforms[i].CheckForPlayer(protag);
      
      //If one of the platforms report having the player on it.
      if(levelArray[levelSelector].levelPlatforms[i].playerOnMe){
      
        playerOnSomething = true; //Set internal flag to true.
      
      }
  
    }
    
    //If no platforms report having the player on them.
    if(playerOnSomething == false){
    
      //Then the player isn't grounded and is thus allowed to fall.
      protag.isGrounded = false;
    
    }
  
  }
  
  //Resets the player on being called.
  void ResetPlayer(){
  
      //Sets the x and y position of the player to the x and y position of the reset point.
      playerPosition.x = resetPoint.x;
      playerPosition.y = resetPoint.y;
  
  }

}
