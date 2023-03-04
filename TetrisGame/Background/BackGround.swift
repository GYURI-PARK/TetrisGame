//
//  BackGround.swift
//  TetrisGame
//
//  Created by GYURI on 2023/02/24.
//

import Foundation
// 테트리스는 2차원 배열에서 진행되므로 2차원 배열 만들기
import SpriteKit

// 클래스 이름은 파일명과 동일하게 설정
class BackGround {
    
    // 2차원 배열 생성
    // variable에서 만든 backarrays 사용하므로 없어도 됨 var arrays = [[Int]]()
    // var arrays1 = Array<Array<Int>>() 도 가능
    // 가로 10, 세로 20 크기의 배열 생성
    let row = 10
    let col = 20
    
    let brickSize = Variables.brickValue.brickSize
    let gap = Variables.gap
    
    // 초기화 후 arrays에 값 집어넣기
    init() {
        Variables.backarrays = Array(repeating: Array(repeating: 0, count: row), count: col)
        bg()
    }
    
    // 테두리 (벽) 만들기
    func bg(){
        for i in 0..<row{
            Variables.backarrays[col-1][i] = 1
        }
        for i in 0..<col-1 {
            Variables.backarrays[i][0] = 1
        }
        for i in 0..<col-1 {
            Variables.backarrays[i][row-1] = 1
        }
        for i in 0..<row {
            Variables.backarrays[0][i] = 1
        }
    }
    
    // 테두리 블럭 생성
    func wall(x : Int, y : Int) -> SKSpriteNode{
        let brick = SKSpriteNode()
        brick.size = CGSize(width: brickSize - gap, height: brickSize - gap)
        brick.color = .blue
        brick.name = "wall"
        brick.zPosition = 1
        let xValue = x * brickSize
        let yValue = y * brickSize
        brick.position = CGPoint(x: xValue, y: yValue)
        return brick
    }
}
