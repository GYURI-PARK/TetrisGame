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
            anim()
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
        
        //  블럭에서 중복된 y값 제거 (set 사용)
        var set = Set<Int>()
        for item in Variables.brickArrays{
            let y = Int(item.y) + Variables.dy
            set.insert(y)
        }
        // 가져온 y값으로 행 체크 (0값이 있는지)
        for y in set.sorted(){
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            // 체크한 행이 0이 포함 되어있지 않으면 실행
            if !Variables.backarrays[y].contains(0){
                Variables.backarrays.remove(at: y)
                Variables.backarrays.insert([2,0,0,0,0,0,0,0,0,2], at: 1)
                print("삭제되었습니다.")
                
                for item in Variables.blockedArrays{
                    // 없어지는 라인이 같은 라인에 있는 경우
                    if Int(item.position.y) == -yValue{
                        if let removeItem = Variables.blockedArrays.firstIndex(of: item){
                            Variables.blockedArrays.remove(at: removeItem)
                            var action = SKAction()
                            action = SKAction.fadeOut(withDuration: 0.1)
                            item.run(action){
                                item.removeFromParent()
                            }
                        }
                    }
                    // 현재 라인보다 위에 있는 경우
                    if Int(item.position.y) > -yValue{
                        var action = SKAction()
                        action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.5)
                        item.run(action)
                    }
                }
               
            }
        }
        
        if isGameOver(deadLine: Variables.dy){
            
            // 새로운 블럭 생성
            NextBrick().nextBrickMoveLeft()
            _ = BrickGenerator()
        }
        
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
    
    // 게임오버 기능
    func isGameOver(deadLine : Int) ->Bool{
        if deadLine > 2 {
            return true
        } else{
            if let scene = GameOver(fileNamed: "GameOver"){
                let transition = SKTransition.moveIn(with: .right, duration: 1)
                Variables.scene.view?.presentScene(scene , transition: transition)
            }
            return false
        }
    }
}
