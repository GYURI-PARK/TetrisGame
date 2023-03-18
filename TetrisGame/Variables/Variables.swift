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
    static var dy = 3
    
    // gap을 이용해 선 표시해주기 -> gap만큼 brick size에서 빼주기
    static var gap = 1
    
    // 시작점 초기화
    static var startPoint = CGPoint()
    
    static var brickArrays = Array<CGPoint>()
    static var brickNode = Array<SKSpriteNode>()
    
    // impossibleDown -> 새로운 블럭 생성
    static var blockedArrays = Array<SKSpriteNode>()
    
    static var isPause = false
    static var nodeGroup = [[SKSpriteNode]]()
    
    // nextbrick에 있는 블럭을 brickGenerator에서 사용하기 위해
    static var newBrickArrays = [Brick.Bricks]()
}
