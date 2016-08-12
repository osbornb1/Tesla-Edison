//
//  GameViewController.swift
//  Tesla vs Edison
//
//  Created by Benjamin Osborn on 8/6/16.
//  Copyright (c) 2016 Benjamin Osborn. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        //Figure out if the orientation is horizontal or vertical - this is a hack because the documentation on UIInterfaceOrientation is confusing
        let currentOrientation = UIApplication.sharedApplication().statusBarOrientation
        
        //initiate the gameboard, passing to the initializing function the screen orientation
        let gameScene = GameScene(size: view.bounds.size, orientation: currentOrientation)
        /* Set the scale mode to make sure that the gameBoard fills the whole skView*/
        gameScene.scaleMode = .AspectFill
        
        //present the gameboard
        skView.presentScene(gameScene)

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
