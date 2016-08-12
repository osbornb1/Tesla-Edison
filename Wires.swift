//
//  Wires.swift
//  Tesla vs Edison
//
//  Created by Benjamin Osborn on 8/8/16.
//  Copyright © 2016 Benjamin Osborn. All rights reserved.
//

import UIKit
import SpriteKit

enum spriteNames: String {
    case WireLengthOne = "WireSize1.png"
    
}

class WireLengthOne: CircuitPart {
    
    init (orientation: Orientation, immutable: Bool, location: CGPoint) {
        
        super.init(orientation: orientation, immutable: immutable, location: location, skNode: SKSpriteNode(imageNamed: spriteNames.WireLengthOne.rawValue))
        
        skNode.position = location
        
        var gameNodes = [GameNode]()
        
        let spriteWidth = self.skNode.size.width
        let spriteHeight = self.skNode.size.height
        
        let zeroLocationRelToTexture = CGPoint(x: location.x + (spriteHeight / 2), y: location.y + (spriteHeight / 2))
        let gameNodeZero = GameNode(location: zeroLocationRelToTexture)
        gameNodes.append(gameNodeZero)
        
        let oneLocationRelToTexture = CGPoint(x: location.x + spriteWidth - (spriteHeight / 2), y: location.y + (spriteHeight / 2))
        let gameNodeOne = GameNode(location: oneLocationRelToTexture)
        gameNodes.append(gameNodeOne)
        
    }
}


