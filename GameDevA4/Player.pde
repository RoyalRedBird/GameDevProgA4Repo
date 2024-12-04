public class Player{

  PVector playerPosition;
  PVector playerVelocity;
  
  float gravityForce = 0.2;
  
  float jumpInputCooldown = 100;
  float jumpCooldownTimer = 0;
  float timerIncrement = 2;
  
  boolean canJump;
  boolean canDoubleJump;
  boolean goingRight;
  boolean goingLeft;
  
  boolean isGrounded;
  
  void PlayerController(){
  
    DrawPlayer();
    PlayerPhysicsHandler();
    
    if(isGrounded){
    
      canJump = true;
      canDoubleJump = true;
    
    }
    
  }
  
  void PlayerPhysicsHandler(){
  
    playerVelocity.y += gravityForce;
    
    if(goingRight){
    
      playerVelocity.x = 3;
      
    }else if(goingLeft){
    
      playerVelocity.x = -3;
      
    }
    
    if(jumpCooldownTimer >= 0){
    
      jumpCooldownTimer -= timerIncrement;
      
    }
    
  }
  
  void PlayerJump(){
  
    if(jumpCooldownTimer == 0){
    
      if(canJump){
    
        playerVelocity.y = 5;
        canJump = false;
        jumpCooldownTimer = jumpInputCooldown;
        isGrounded = false;
    
      }else if(canDoubleJump){
      
        playerVelocity.y = 5;
        canDoubleJump = false;
        
      }
    
    }   
  
  }
  
  void DrawPlayer(){
  
    fill(0, 255, 0);
    rect(playerPosition.x, playerPosition.y, 50, 50);
    
  }

}
