//
//  DownButton.swift
//  TetrisGame
//
//  Created by GYURI on 2023/03/15.
//

import Foundation
import SpriteKit

class DownButton {
    
    let btn = SKSpriteNode()
    init() {
        btn.texture = SKTexture(imageNamed: "down_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "down"
        btn.zPosition = 1
        let point1 = Int(Variables.scene.frame.width) / 2
        let point2 = -50
        let xValue = (point1 - point2) / 2
        btn.position = CGPoint(x: xValue, y: -Int(Variables.scene.frame.height) + 40)
        Variables.scene.addChild(btn)
    }
    
    func anim(){
        var textures = Array<SKTexture>()
        var action = SKAction()
        for i in 1...15{
            let name = "down_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    
    // 블럭을 아래로 내리는 함수
    func brickDown(){
        if isbrickDownable(){
            possibleDown()
        } else{
            impossibleDown()
        }
    }
    
    // 블럭이 아래로 내려갈 수 있는 경우
    func possibleDown(){
        Variables.dy += 1
        var action = SKAction()
        for (i, item) in Variables.brickArrays.enumerated(){
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            Variables.backarrays[y - 1][x] -= 1
            Variables.backarrays[y][x] += 1
            action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.1)
            Variables.brickNode[i].run(action)
        }
        
    }
    
    func impossibleDown(){
        // 1. 블럭의 위치 값을 2로 변경
        for item in Variables.brickArrays{
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backarrays[y][x] = 2
            
            // 2. 새로운 블럭 생성 -> Variables에 추가 (blocked)
            let blocked = SKSpriteNode()
            blocked.color = .gray
            blocked.size = CGSize(width: Variables.brickValue.brickSize - Variables.gap, height: Variables.brickValue.brickSize - Variables.gap)
            blocked.name = "blocked"
            let xValue = x * Variables.brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            blocked.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(blocked)
            Variables.blockedArrays.append(blocked)
        }
        // 3. 현재 블럭 삭제
        for item in Variables.brickNode{
            item.removeFromParent()
        }
        
        // 데이터 체크
        for item in Variables.backarrays{
            print(item)
        }
        
        // 한줄 채워지며 삭제되는 함수
        checkDelete()
    }
    
    // 4. 새로운 SKNode 생성
    func checkDelete(){
        
        // 새로운 brick 생성
        _ = BrickGenerator()
    }
    
    func isbrickDownable() -> Bool{
        for item in Variables.brickArrays{
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            if Variables.backarrays[y+1][x] == 2{
                return false
            }
        }
        return true
    }
}
