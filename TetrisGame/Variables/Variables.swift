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
    // main에 있는 scene 받아오기
    static var scene = SKScene()
    
    static var brickValue = Brick().bricks()
    
    // 시작점 설정 = 블럭의 기준점
    static var dx = 4
    static var dy = 2
}
