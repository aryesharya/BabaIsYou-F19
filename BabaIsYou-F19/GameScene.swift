//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player:SKSpriteNode!
    var isblock1:SKSpriteNode!
    var stopblock:SKSpriteNode!
    var flagblock:SKSpriteNode!
    var flag:SKSpriteNode!
    var wallblock:SKSpriteNode!
    var winblock:SKSpriteNode!
    var isblock2:SKSpriteNode!
    var wall1:SKSpriteNode!
    var wall2:SKSpriteNode!
    var wall3:SKSpriteNode!
    var wall4:SKSpriteNode!
    
    let PLAYER_SPEED:CGFloat = 20

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        self.player = self.childNode(withName: "player") as? SKSpriteNode
        self.isblock1 = self.childNode(withName: "isblock1") as? SKSpriteNode
        self.stopblock = self.childNode(withName: "stopblock") as? SKSpriteNode
        self.flagblock = self.childNode(withName: "flagblock") as? SKSpriteNode
        self.flag = self.childNode(withName: "flag") as? SKSpriteNode
        self.wallblock = self.childNode(withName: "wallblock") as? SKSpriteNode
        self.winblock = self.childNode(withName: "winblock") as? SKSpriteNode
        self.isblock2 = self.childNode(withName: "isblock2") as? SKSpriteNode
        self.wall1 = self.childNode(withName: "wall1") as? SKSpriteNode
        self.wall2 = self.childNode(withName: "wall2") as? SKSpriteNode
        self.wall3 = self.childNode(withName: "wall3") as? SKSpriteNode
        self.wall4 = self.childNode(withName: "wall4") as? SKSpriteNode
        
        
        //TO move the player
        //let moveLeftAction = SKAction.moveBy(x: -400, y: 0, duration: 15)
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
    
        
        if (nodeA!.name == "player" && nodeB!.name == "flag") {
                   
                   print("Player wins!")
                   
               }
               if (nodeA!.name == "player" && nodeB!.name == "isblock") {
                   print("Player collided with isblock")
                
                   }
        
        if (nodeA!.name == "player" && nodeB!.name == "winblock") {
           print("Player collided with winblock")
        
           }
        
        if (nodeA!.name == "player" && nodeB!.name == "wallblock") {
           print("Player collided with wallblock")
        
           }
        
        if (nodeA!.name == "player" && nodeB!.name == "stopblock") {
           print("Player collided with stopblock")
        
           }
        
        if (nodeA!.name == "player" && nodeB!.name == "flagblock") {
           print("Player collided with flagblock")
        
           }
        
        if (nodeA!.name == "player" && nodeB!.name == "wall") {
           print("Player collided with wall")
        
           }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let mouseTouch = touches.first
               if (mouseTouch == nil) {
                   return
               }
               let location = mouseTouch!.location(in: self)

               // WHAT NODE DID THE PLAYER TOUCH
               // ----------------------------------------------
               let nodeTouched = atPoint(location).name
               
               
               
               // GAME LOGIC: Move player based on touch
               if (nodeTouched == "upButton") {
                   // move up
                   self.player.position.y = self.player.position.y + PLAYER_SPEED
               }
               else if (nodeTouched == "downButton") {
                   // move down
                    self.player.position.y = self.player.position.y - PLAYER_SPEED
               }
               else if (nodeTouched == "leftButton") {
                   // move left
                    self.player.position.x = self.player.position.x - PLAYER_SPEED
               }
               else if (nodeTouched == "rightButton") {
                   // move right
                    self.player.position.x = self.player.position.x + PLAYER_SPEED
               }
        
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
