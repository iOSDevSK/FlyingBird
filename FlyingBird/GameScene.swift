//
//  GameScene.swift
//  FlyingBird
//
//  Created by Filip Dvoran on 12/12/14.
//  Copyright (c) 2014 VANACOM s.r.o. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    var bird = SKSpriteNode()
    var flyingBridFrames = [SKTexture]()
    let birdSize = CGFloat(0.25)
    weak var touch: UITouch?
    var birdAngle: CGFloat = 0.0
    
    override func didMoveToView(view: SKView) {
        
        var temp = flyingBridFrames[0]
        self.bird = SKSpriteNode(texture: temp)
        self.bird.size = CGSize(width: self.bird.size.width*self.birdSize, height: self.bird.size.height*self.birdSize)
        self.bird.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(bird)
        self.flyingBird()
    }
    
    
    func flyingBird() {
    
        let animate = SKAction.animateWithTextures(flyingBridFrames, timePerFrame: 0.1)
        self.bird.runAction(SKAction.repeatActionForever(animate)) { () -> Void in
        
     }
        
        
    }
    
    func initBirdFrames() {
       
        var flyFrames = [SKTexture]()
        let birdAnimetedAtlas = SKTextureAtlas(named: "BirdImages")
        let numImages = birdAnimetedAtlas.textureNames.count
        
        for i in 1...numImages {
            var textureName = String(format: "frame%d",i)
            var temp = birdAnimetedAtlas.textureNamed(textureName)
            flyFrames.append(temp)
            
        }
        
        for var i=numImages-1; i>=1; i-- {
            var textureName = String(format: "frame%d",i)
            var temp = birdAnimetedAtlas.textureNamed(textureName)
            flyFrames.append(temp)
        }
        
        self.flyingBridFrames = flyFrames
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = UIColor.whiteColor()
        self.initBirdFrames()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.touch = touches.anyObject() as? UITouch

    }
    

    
    func sqr(c:CGFloat) -> CGFloat {
        return c*c
    }
    
    func handleTouch() {
        
        if let touch = self.touch {
            var touchPoint = touch.locationInNode(self)
            

            
            let birdPositionX = self.bird.position.x - 29.0
            let birdPositionY = self.bird.position.y
            
            let bp = CGPoint(x: birdPositionX, y: birdPositionY)
            
            let birdPoint = bp
            
            //
            
            let b = touchPoint.y - birdPoint.y
            let a = touchPoint.x - birdPoint.x
            
            let c = sqrt(self.sqr(a) + self.sqr(b))
            
            
            if touchPoint.x > birdPoint.x {
                self.birdAngle = sinh(b / c)
            }
            else {
                self.birdAngle = sinh(b / c) + CGFloat(M_PI)
            }
            
            let birdRotation = SKAction.rotateToAngle(self.birdAngle, duration: 0.5)
            self.bird.runAction(birdRotation)
                
            
            //
            
            let touchPositionX = touchPoint.x - 29.0
            let touchPositionY = touchPoint.y
            
            touchPoint = CGPoint(x: touchPositionX, y: touchPositionY)
            
            
            let destination = touchPoint
            let move = SKAction.moveTo(destination, duration: 1)
            let remove = SKAction.removeFromParent()
            let moveAndRemove = SKAction.sequence([move, remove])
            
            self.bird.runAction(move)
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        self.handleTouch()
       
    }
}
