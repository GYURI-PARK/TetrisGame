//
//  LeftButton.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/10.
//

import Foundation
import SpriteKit

class LeftButton {
    
    init() {
        let btn = SKSpriteNode()
        btn.texture = SKTexture(imageNamed: "left_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "left"
        btn.position = CGPoint(x: 50, y: -Int(Variables.scene.frame.height)+50)
        Variables.scene.addChild(btn)
    } // LeftButton정의 후 초기화 -> 메인 클래스에 LeftButton 인스턴스 생성
    
    func brickMoveLeft(){
        if isMovale(){
            Variables.dx -= 1
            var action = SKAction()
            for (i, item) in Variables.brickArrays.enumerated(){
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                
                Variables.backarrays[y][x+1] -= 1
                Variables.backarrays[y][x] += 1
                action = SKAction.moveBy(x: CGFloat(Variables.brickValue.brickSize), y: 0, duration: 0.1)
                Variables.brickNode[i].run(action)
            }
        }
    }
    
    // 블럭의 가장 왼쪽 좌표의 왼쪽 값이 1일 경우 더 이상 왼쪽으로 이동하지 못하므로
    // 최좌측점을 찾기 위한 함수가 필요하다.
    func isMovale() -> Bool {
        
        // 블럭 최좌측 포인트 찾기
        var left = Variables.brickArrays[0]
        for i in Variables.brickArrays{
            if left.x > i.x {
                left = i
            }
        }
        // 최좌측점의 왼쪽값이 1인지 아닌지 판별
        let xValue = Int(left.x) + Variables.dx - 1
        if Variables.backarrays[Variables.dy][xValue] != 0{
            return false
        } else{
            return true
        }
    }
    
}
