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
    
    // 새로운 블럭을 가져오는 함수 정의
//    func bricks() -> Brick {
//        var bricks = Bricks()
//
//        var brick1 = [CGPoint]()
//        brick1.append(CGPoint(x: 0, y: 0)) // 각각의 블럭이 처음에 가지고 있는 위치값 집어넣기
//
//    }
}
