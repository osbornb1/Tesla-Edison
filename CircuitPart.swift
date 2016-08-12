//
//  CircuitPart.swift
//  Tesla vs Edison
//
//  Created by Benjamin Osborn on 8/8/16.
//  Copyright © 2016 Benjamin Osborn. All rights reserved.
//

import SpriteKit

enum Orientation {
    case Zero
    case PiOverTwo
    case Pi
    case ThreePiOverTwo
}

class CircuitPart {
    
    let skNode: SKSpriteNode
    var gameNodes = [GameNode]()
    var selected: Bool = false
    var currentAmps: Int = 0
    
    var orientation: Orientation
    let immutable: Bool
    var location: CGPoint
    
    init (orientation: Orientation, immutable: Bool, location: CGPoint, skNode: SKSpriteNode) {
        
        self.orientation = orientation
        self.immutable = immutable
        self.location = location
        self.skNode = skNode
    }
    
    func rotate(clockwise: Bool) {
        //rotates sprite, updates locations of all nodes
        skNode.zRotation = (clockwise == true) ? CGFloat(M_PI_2 * -1) : CGFloat(M_PI_2)
        
        
    }
    
//    func transform2D(inputPoint: CGPoint, clockwise: Bool) -> CGPoint {
//        //takes in point (e.g. of a gameNode), the width and height of the sprite, and the vector transform, returns new point
//        //extract coordinates relative to the location of the spriteNode
//        let inX = inputPoint.x - location.x
//        let inY = inputPoint.y - location.y
//        //apply the transform
//        let outX = inY
//        let outY = inX * -1
//    }
    
}
