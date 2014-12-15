//
//  GameViewController.swift
//  FlyingBird
//
//  Created by Filip Dvoran on 12/12/14.
//  Copyright (c) 2014 VANACOM s.r.o. All rights reserved.
//

import UIKit
import SpriteKit



class GameViewController: UIViewController {
    
    override func loadView() {
        
        let view = SKView(frame: UIScreen.mainScreen().bounds)
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
            let scene = GameScene(size: self.view.bounds.size)
            let skView = self.view as SKView
        
            skView.showsFPS = true
            skView.showsNodeCount = true
        
            skView.ignoresSiblingOrder = true
        
            scene.scaleMode = .AspectFill
    
            skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
