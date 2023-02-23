//
//  Brick.swift
//  TetrisGame
//
//  Created by GYURI on 2023/02/24.
//

import Foundation
import SpriteKit

class Brick{

    struct Bricks {
        // 블럭 속성 정의
        var color = UIColor()
        var points = Array<CGPoint>()
        var brickSize = 35
        let zPosition = CGFloat(1)
        var brickName = String()
    }
}
