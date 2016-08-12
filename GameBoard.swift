//
//  GameScene.swift
//  Tesla vs Edison
//
//  Created by Benjamin Osborn on 8/6/16.
//  Copyright (c) 2016 Benjamin Osborn. All rights reserved.
//

import SpriteKit

//overload addition and subtraction to allow for vector addition and subtraction.
func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

enum gameTools: String {
    case RotateLeftArrow = "RotateLeftArrow.png"
    case RotateRightArrow = "RotateRightArrow.png"
}

class GameScene: SKScene {
    
    //gameBoard and gameTools background variables, set to zero to avoid problem of initializer self reference
    var gameBoardBackgroundPosition: CGPoint = CGPoint(x: 0, y:0)
    var gameToolsBackgroundPosition: CGPoint = CGPoint(x: 0, y:0)
    var gameToolsWidth: Int = 0
    var gameToolsHeight: Int = 0
    var gameBoardWidth: Int = 0
    var gameBoardHeight: Int = 0
    var UILandscape: Bool = true
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(size: CGSize, orientation: UIInterfaceOrientation) {
        
        super.init(size: size)
        
        if orientation == UIInterfaceOrientation.LandscapeLeft || orientation == UIInterfaceOrientation.LandscapeRight {
            UILandscape = true
        } else {
            UILandscape = false
        }
        
        //Note: I am placing the "meat" of the code in the init section, rather than didMoveToView, because I read online that didMoveToView gets called before the screen orientation is recognized and I therefore cannot customize the layout as I want.  Alternative: set a variable in init, and use that variable in did move to View.
        
        let sceneWidth = Int(size.width)
        let sceneHeight = Int(size.height)
        
        if UILandscape {
            //configure gameboard background in landscape
            gameBoardBackgroundPosition = CGPoint(x: 0, y: 0)
            gameBoardWidth = (4 * sceneWidth) / 5
            gameBoardHeight = sceneHeight
            
            //configure gameTools background
            gameToolsBackgroundPosition = CGPoint(x: (4 * sceneWidth) / 5, y: 0)
            gameToolsWidth = (1 * sceneWidth) / 5
            gameToolsHeight = sceneHeight

        } else {
            //configure gameboard background in portrait
            gameBoardBackgroundPosition = CGPoint(x: 0, y: (1 * sceneHeight) / 5)
            gameBoardWidth = sceneWidth
            gameBoardHeight = (4 * sceneHeight) / 5
            
            //configure gametools background
            gameToolsBackgroundPosition = CGPoint(x: 0, y: 0)
            gameToolsWidth = sceneWidth
            gameToolsHeight = (1 * sceneHeight) / 5
            
        }

        //draw gameBoard background and add to scene
        let gameBoardRect = CGRect(x: Int(gameBoardBackgroundPosition.x), y: Int(gameBoardBackgroundPosition.y), width: gameBoardWidth, height: gameBoardHeight)
        let gameBoardNode = SKShapeNode(rect: gameBoardRect, cornerRadius: 10)
        gameBoardNode.fillColor = UIColor.redColor()
        gameBoardNode.strokeColor = UIColor.whiteColor()
        self.addChild(gameBoardNode)
        
        //draw gameTools background and add to scene
        let gameToolsRect = CGRect(x: Int(gameToolsBackgroundPosition.x), y: Int(gameToolsBackgroundPosition.y), width: gameToolsWidth, height: gameToolsHeight)
        let gameToolsNode = SKShapeNode(rect: gameToolsRect, cornerRadius: 10)
        gameToolsNode.fillColor = UIColor.init(red: 1.0, green: 0, blue: 0, alpha: 0.5)
        gameToolsNode.strokeColor = UIColor.whiteColor()
        self.addChild(gameToolsNode)
        
        //draw gameTools on top of the gameTools background
        drawGameTools(gameToolsNode)
        
        let wireOne = WireLengthOne(orientation: .Zero, immutable: false, location: CGPoint(x: 0, y: 500))
        
        gameBoardNode.addChild(wireOne.skNode)
        
        wireOne.rotate(true)
        wireOne.rotate(false)
        
    }
    
    override func didMoveToView(view: SKView) {
        

        

        
//        let wire = SKSpriteNode(imageNamed: "WireSize1.png")
//        wire.anchorPoint = CGPoint(x: 0, y: 0)
//        wire.position = CGPoint(x: sceneWidth/2, y: sceneHeight/2)
//        
//        backgroundShapeNode.addChild(wire)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {

        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func drawGameTools(parentNode: SKNode) -> Void {
        //generate images first so you have access to their dimensions
        let rotateLeftNode = SKSpriteNode(imageNamed: "RotateLeftArrow.png")
        let rotateRightNode = SKSpriteNode(imageNamed: "RotateRightArrow.png")
        
        //set anchor points
        rotateLeftNode.anchorPoint = CGPoint(x: 0, y: 0)
        rotateRightNode.anchorPoint = CGPoint(x: 0, y: 0)
        
        //configure locations
        if UILandscape{
            rotateLeftNode.position = gameToolsBackgroundPosition + CGPoint(x: 15, y: 15)
            rotateRightNode.position = gameToolsBackgroundPosition + CGPoint(x: gameToolsWidth - 15 - Int(rotateRightNode.size.width), y: 15)
        } else {
            rotateLeftNode.position = gameToolsBackgroundPosition + CGPoint(x: 15, y: 15)
            rotateRightNode.position = gameToolsBackgroundPosition + CGPoint(x: 15, y: gameToolsHeight - 15 - Int(rotateRightNode.size.height))
        }

        //add the buttons
        parentNode.addChild(rotateLeftNode)
        parentNode.addChild(rotateRightNode)
    }
}
