//
//  GameViewController.swift
//  TetrisGame
//
//  Created by GYURI on 2023/02/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            let scene = GameScene(size: view.frame.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
            // 원점을 왼쪽 상단으로 설정
            scene.anchorPoint = CGPoint(x: 0, y: 1)
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
