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
    let heroSpeed: CGFloat = 100.0
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.green
        
        let xCoord = size.width * 0.5
        let yCoord = size.height * 0.5
        
        hero.size.height = 50
        hero.size.width = 50
        
        hero.position = CGPoint(x: xCoord, y: yCoord)
        
        addChild(hero)
        

        
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedUp))
        
        swipeUp.direction = .up
        
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedDown))
        
        swipeDown.direction = .down
        
        view.addGestureRecognizer(swipeDown)
        
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        
        swipeRight.direction = .right
        
        view.addGestureRecognizer(swipeRight)
        
    }
    
    
    func swipedUp(sender:UISwipeGestureRecognizer){
        
        print("Up")
        
        var actionMove: SKAction
        actionMove = SKAction.move(to: CGPoint (x: hero.position.x, y: hero.position.y + heroSpeed), duration: 1)
        hero.run(actionMove)
    }
    
    func swipedDown(sender:UISwipeGestureRecognizer){
        
        print("Down")
        
        var actionMove: SKAction
        actionMove = SKAction.move(to: CGPoint (x: hero.position.x, y: hero.position.y - heroSpeed), duration: 1)
        hero.run(actionMove)
    }
    func swipedLeft(sender:UISwipeGestureRecognizer){
        
        print("Left")
        
        var actionMove: SKAction
        actionMove = SKAction.move(to: CGPoint (x: hero.position.x - heroSpeed, y: hero.position.y), duration: 1)
        hero.run(actionMove)
    }
    func swipedRight(sender:UISwipeGestureRecognizer){
        
        print("Right")
        
        var actionMove: SKAction
        actionMove = SKAction.move(to: CGPoint (x: hero.position.x  + heroSpeed, y: hero.position.y), duration: 1)
        hero.run(actionMove)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        let bullet = SKSpriteNode()
        
        bullet.color = UIColor.red

        bullet.size = CGSize(width: 10, height: 10)
        
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
