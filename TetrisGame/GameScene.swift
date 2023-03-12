//
//  GameScene.swift
//  TetrisGame
//
//  Created by GYURI on 2023/02/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftButton : LeftButton?
    override func didMove(to view: SKView) {
        
        Variables.scene = self
        // scene 초기화
        
        _ = BackGround()
        // 만들어진 2차배열을 다른곳에서도 사용 가능하도록 전역변수로 설정
        _ = BrickGenerator()
        // checkBrick()
        
        leftButton = LeftButton()
    }
    
    // 콘솔창에서 배열 확인 편하게 하려고 만드는거
    func checkBrick(){
        let arrays = Variables.backarrays
        for item in arrays{
            print(item)
        }
    }
    
    // 터치 이벤트 처리
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location!)
        for item in node{
            if item.name == "left"{
                leftButton?.brickMoveLeft()
            }
        }
    }
}
