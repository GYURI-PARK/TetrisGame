//
//  GameScene.swift
//  TetrisGame
//
//  Created by GYURI on 2023/02/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Function 폴더에 각각의 클래스 정의 후 메인 클래스(Gamescene)에서 인스턴스 생성해주기
    var leftButton : LeftButton?
    var rightButton : RightButton?
    var rotationButton : RotationButton?
    var downButton : DownButton?
    var stopButton : StopButton?
    var sounds : Sounds?
    var updateTime = 0.0
    
    override func didMove(to view: SKView) {
        setting()
    }
    
    func setting(){
        Variables.scene = self
        // scene 초기화
        
        _ = BackGround()
        // 만들어진 2차배열을 다른곳에서도 사용 가능하도록 전역변수로 설정
        NextBrick().addBrick()
        _ = BrickGenerator()
        
        leftButton = LeftButton()
        rightButton = RightButton()
        rotationButton = RotationButton()
        downButton = DownButton()
        stopButton = StopButton()
        sounds = Sounds()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if updateTime == 0{
            updateTime = currentTime
        }
        if currentTime - updateTime > 0.7 {
            updateTime = currentTime
            if !Variables.isPause{
                downButton?.brickDown()
            }
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
                sounds?.buttonSounds(buttonName: "move")
            }
            if item.name == "right"{
                rightButton?.brickMoveRight()
                sounds?.buttonSounds(buttonName: "move")
            }
            if item.name == "rotation"{
                rotationButton?.brickRoation()
                sounds?.buttonSounds(buttonName: "rotation")
            }
            if item.name == "down"{
                while(downButton?.isbrickDownable())! {
                    downButton?.brickDown()
                }
                sounds?.buttonSounds(buttonName: "down")
            }
            if item.name == "stop"{
                stopButton?.brickStop()
            }
        }
    }
}
