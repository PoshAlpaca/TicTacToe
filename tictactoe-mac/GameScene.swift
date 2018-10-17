//
//  GameScene.swift
//  tictactoe-mac
//
//  Created by Nikolai Guyot on 04.10.18.
//  Copyright © 2018 Nikolai Guyot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var background = SKSpriteNode()
    var field = Field()
    
    override func didMove(to view: SKView) {
        backgroundColor = NSColor.white
        
        background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.isUserInteractionEnabled = false
        addChild(background)
        
        field.markers.position = CGPoint(x: 0, y: 0)
        addChild(field.markers)
    }
    
    override func mouseDown(with event: NSEvent) {
        field.touch(event.location(in: self))
    }
}
