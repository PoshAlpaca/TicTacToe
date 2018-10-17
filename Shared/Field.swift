//
//  Field.swift
//  tictactoe
//
//  Created by Nikolai Guyot on 04.10.18.
//  Copyright © 2018 Nikolai Guyot. All rights reserved.
//

import Foundation
import SpriteKit

class Field {
    var markers = SKNode()
    
    var turn = 0
    var field = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3) {
        didSet {
            updateView()
        }
    }
    
    func touch(_ location: CGPoint) {
        let acceptedRange: ClosedRange<CGFloat> = -300...300
        
        if acceptedRange.contains(location.x) && acceptedRange.contains(location.y) {
            let cell = pointToCell(location)
            print("Cell is: \(cell)")
            applyMove(cell)
        }
    }
    
    func createMarker(at cell: (Int, Int), withTexture texture: String) {
        var marker = SKSpriteNode()
        
        marker = SKSpriteNode(imageNamed: texture)
        marker.position = cellToPoint((cell.0, cell.1))
        markers.addChild(marker)
    }
    
    func pointToCell(_ point: CGPoint) -> (Int, Int) {
        let x = coordinateToInternal(point.x)
        let y = coordinateToInternal(point.y)
        
        return (x, y)
    }
    
    func cellToPoint(_ cell: (Int, Int)) -> CGPoint {
        let x = internalToCoordinate(cell.0)
        let y = internalToCoordinate(cell.1)
        
        return CGPoint(x: x, y: y)
    }
    
    func coordinateToInternal(_ coordinate: CGFloat) -> Int {
        let scaledCoordinate = round(coordinate / 200) + 1
        return Int(scaledCoordinate)
    }
    
    func internalToCoordinate(_ scaledCoordinate: Int) -> CGFloat {
        let coordinate = (scaledCoordinate - 1) * 200
        return CGFloat(coordinate)
    }
    
    func applyMove(_ cell: (Int, Int)) {
        if field[cell.0][cell.1] == 0 {
            field[cell.0][cell.1] = computeTurn()
            turn += 1
        }
    }
    
    func computeTurn() -> Int {
        return turn % 2 + 1 // + 1 is there so that player 1 gets saved as 1 and not 0, player 2 as 2 and not 1
    }
    
    func updateView() {
        markers.removeAllChildren()
        
        for (x, column) in field.enumerated() {
            for (y, cell) in column.enumerated() {
                
                switch cell {
                case 1:
                    createMarker(at: (x, y), withTexture: "cross")
                case 2:
                    createMarker(at: (x, y), withTexture: "circle")
                default:
                    break
                }
            }
        }
    }
}
