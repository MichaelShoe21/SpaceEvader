//
//  GameScene.swift
//  SpaceEvader
//
//  Created by iD Student on 8/2/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let hero = SKSpriteNode(imageNamed: "Spaceship")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.green
        
        let xCoord = size.width * 0.5
        let yCoord = size.height * 0.5
        
        hero.size.height = 50
        hero.size.width = 50
        
        hero.position = CGPoint(x: xCoord, y: yCoord)
        
        addChild(hero)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        let bullet = SKSpriteNode()
        
        bullet.color = UIColor.red

        bullet.size = CGSize(width: 5, height: 5)
        
        bullet.position = CGPoint(x: hero.position.x, y: hero.position.y)
        
        addChild(bullet)
        
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        let vector = CGVector(dx: -(hero.position.x - touchLocation.x), dy: -(hero.position.y - touchLocation.y))
   
        let projectileAction = SKAction.sequence([
      
        SKAction.repeat(
        
        SKAction.move(by: vector, duration: 0.5), count: 10),
        
        SKAction.wait(forDuration: 0.5),
        
        SKAction.removeFromParent()
        
        ])
        
        bullet.run(projectileAction)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
