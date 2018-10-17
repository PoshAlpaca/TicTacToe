//
//  GameScene.swift
//  tictactoe
//
//  Created by Nikolai Guyot on 26.09.18.
//  Copyright © 2018 Nikolai Guyot. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var background = SKSpriteNode()
    var field = Field()
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.isUserInteractionEnabled = false
        addChild(background)
        
        field.markers.position = CGPoint(x: 0, y: 0)
        addChild(field.markers)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("Location is: \(location)")
            field.touch(location)
        }
    }
}
