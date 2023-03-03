//
//  GameScene.swift
//  TetrisGame
//
//  Created by GYURI on 2023/02/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        
        Variables.scene = self
        // scene 초기화
        
        let bg = BackGround()
        // 만들어진 2차배열을 다른곳에서도 사용 가능하도록 전역변수로 설정
        let generator = BrickGenerator()
        checkBrick()
    }
    
    // 콘솔창에서 배열 확인 편하게 하려고 만드는거
    func checkBrick(){
        let arrays = Variables.backarrays
        for item in arrays{
            print(item)
        }
    }
}
