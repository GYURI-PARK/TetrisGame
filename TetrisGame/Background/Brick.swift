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
    func bricks() -> Bricks{
        var bricks = [Bricks]()

        // 하나의 테트리스 블럭 모양 정의
        var brick1 = [CGPoint]()
        brick1.append(CGPoint(x: 0, y: 0)) // 각각의 블럭이 처음에 가지고 있는 위치값 집어넣기
        brick1.append(CGPoint(x: 1, y: 0))
        brick1.append(CGPoint(x: -1, y: 0))
        brick1.append(CGPoint(x: 0, y: 1))
        bricks.append(Bricks(color: .red, points: brick1, brickName: "brick1"))
        
        var brick2 = [CGPoint]()
        brick2.append(CGPoint(x: -1, y: 0))
        brick2.append(CGPoint(x: 0, y: 0))
        brick2.append(CGPoint(x: 1, y: 0))
        brick2.append(CGPoint(x: 2, y: 0))
        bricks.append(Bricks(color: .cyan, points: brick2, brickName: "brick2"))
        
        var brick3 = [CGPoint]()
        brick3.append(CGPoint(x: 0, y: 0))
        brick3.append(CGPoint(x: 1, y: 0))
        brick3.append(CGPoint(x: 0, y: 1))
        brick3.append(CGPoint(x: -1, y: 1))
        bricks.append(Bricks(color: .green , points: brick3, brickName: "brick3"))
        
        var brick4 = [CGPoint]()
        brick4.append(CGPoint(x: -1, y: 1))
        brick4.append(CGPoint(x: -1, y: 0))
        brick4.append(CGPoint(x: 0, y: 0))
        brick4.append(CGPoint(x: 1, y: 0))
        bricks.append(Bricks(color: .purple, points: brick4, brickName: "brick4"))
        
        var brick5 = [CGPoint]()
        brick5.append(CGPoint(x: 1, y: 0))
        brick5.append(CGPoint(x: 0, y: 0))
        brick5.append(CGPoint(x: 1, y: -1))
        brick5.append(CGPoint(x: 0, y: -1))
        bricks.append(Bricks(color: .orange, points: brick5, brickName: "brick5"))
        
        var brick6 = [CGPoint]()
        brick6.append(CGPoint(x: 1, y: 1))
        brick6.append(CGPoint(x: -1, y: 0))
        brick6.append(CGPoint(x: 0, y: 0))
        brick6.append(CGPoint(x: 1, y: 0))
        bricks.append(Bricks(color: .yellow, points: brick6, brickName: "brick6"))
        
        var brick7 = [CGPoint]()
        brick7.append(CGPoint(x: 0, y: 0))
        brick7.append(CGPoint(x: -1, y: 0))
        brick7.append(CGPoint(x: 0, y: 1))
        brick7.append(CGPoint(x: 1, y: 1))
        bricks.append(Bricks(color: .systemPink, points: brick7, brickName: "brick7"))
        
        // 7개의 블럭들 중 랜덤으로 bricks에 넣어주기
        let random = Int.random(in: 0..<7)
        return bricks[1]
    }
}
