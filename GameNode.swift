//
//  GameNode.swift
//  Tesla vs Edison
//
//  Created by Benjamin Osborn on 8/8/16.
//  Copyright © 2016 Benjamin Osborn. All rights reserved.
//

import UIKit

class GameNode {
    var joinedTo: [GameNode]
    var location: CGPoint
    
    init (location: CGPoint) {
        self.joinedTo = [GameNode]()
        self.location = location
    }
    
}


