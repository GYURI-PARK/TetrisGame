//
//  Variables.swift
//  TetrisGame
//
//  Created by GYURI on 2023/02/24.
//

import Foundation
import SpriteKit

struct Variables {
    static var backarrays = [[Int]]()
    static var scene = SKScene()
    // main에 있는 scene 받아오기
    static var brickValue = Brick().bricks()
}
