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
        print("Left Button")
    }
    
}
