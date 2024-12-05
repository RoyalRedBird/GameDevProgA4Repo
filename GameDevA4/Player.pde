public class Player{

  PVector playerPosition = new PVector(0, 0);
  PVector playerVelocity = new PVector(0, 0);
  PVector resetPoint = new PVector(0, 0);
  
  float gravityForce = 0.2;
  
  int jumpInputCooldown = 100;
  int jumpCooldownTimer = 0;
  int timerIncrement = 5;
  
  boolean canJump = false;
  boolean canDoubleJump = false;
  boolean goingRight = false;
  boolean goingLeft = false;
  
  boolean isGrounded = false;
  boolean hitTheCeiling = false;
  
  void PlayerController(){
  
    DrawPlayer();
    PlayerPhysicsHandler();
    PlayerCollisionChecker();
    PlayerBoundsChecker();
    
  }
  
  void PlayerBoundsChecker(){
  
    if(playerPosition.x <= 0 || playerPosition.x >= width){
    
      println("Resetting the player at " + resetPoint.x + ", " + resetPoint.y);
      playerPosition.x = resetPoint.x;
      playerPosition.y = resetPoint.y;
    
    }
    
    if(playerPosition.y > height){
    
      println("Resetting the player at " + resetPoint.x + ", " + resetPoint.y);
      playerPosition.x = resetPoint.x;
      playerPosition.y = resetPoint.y;
    
    }
  
  }
  
  void PlayerPhysicsHandler(){
  
    playerVelocity.y += gravityForce;
    
    if(goingRight){
      
      playerVelocity.x = 3;
            
    }else if(goingLeft){
    
      playerVelocity.x = -3;
            
    }else{
    
      playerVelocity.x = 0;
    
    }
    
    if(jumpCooldownTimer >= 0){
    
      jumpCooldownTimer -= timerIncrement;
      
    }
    
    if(playerVelocity.y < 0){
    
      isGrounded = false;
    
    }
    
    if(isGrounded){
    
      playerVelocity.y = 0;
      
    }
    
    if(hitTheCeiling){
    
      playerVelocity.y = 0;
      hitTheCeiling = false;
    
    }
    
    playerPosition.add(playerVelocity);
    
  }
  
  void PlayerJump(){
  
    if(canJump){
        
        isGrounded = false;
        playerVelocity.y = 0;
        playerVelocity.y += -5;
        canJump = false;
        jumpCooldownTimer = jumpInputCooldown;     
    
      }else if(canDoubleJump ){
        
        playerVelocity.y = 0;
        playerVelocity.y += -5;
        canDoubleJump = false;
        jumpCooldownTimer = jumpInputCooldown; 
        
      }
  
  }
  
  void DrawPlayer(){
  
    fill(0, 255, 0);
    rect(playerPosition.x, playerPosition.y, 20, 20);
    
  }
  
  void PlayerCollisionChecker(){
    
    boolean playerOnSomething = false;

    for(int i = 0; i < levelArray[levelSelector].levelPlatforms.length; i++){
    
      levelArray[levelSelector].levelPlatforms[i].CheckForPlayer(protag);
      
      if(levelArray[levelSelector].levelPlatforms[i].playerOnMe){
      
        playerOnSomething = true;
      
      }
  
    }
    
    if(playerOnSomething == false){
    
      protag.isGrounded = false;
    
    }
  
  }

}
