//
//  TutorialScene.swift
//  NossoMeio
//
//  Created by rebeca rodrigues on 18/11/22.
//

import SpriteKit

class TutorialScene: SKScene {
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "tutorialUm")
        background.anchorPoint = self.anchorPoint
        background.scale(to: scene!.size)
        background.zPosition = -1
        
        self.addChild(background)

    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
     //   self.backgroundColor = SKColor.white
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        passSceneButton()
    }
    
    func passSceneButton() {
        let image = SKSpriteNode(imageNamed: "seta")
        let scale = SKAction.scale(to: 0.4, duration: 0.1)
        image.size = CGSize(width: 70, height: 50)
        
        let button = StartButton(image: image) {
            self.run(scale)
        } actionEnded: {
            let transition = SKTransition.reveal(with: .left, duration: 0.3)
            let tutorialScene2 = TutorialScene2(size: self.size)
            self.view?.presentScene(tutorialScene2, transition: transition)
        }
       
        //x 405, y 185 fica no meio da tela
        button.position = CGPoint(x: 705, y: 185)
        
        
        addChild(button)
    }
    
}
