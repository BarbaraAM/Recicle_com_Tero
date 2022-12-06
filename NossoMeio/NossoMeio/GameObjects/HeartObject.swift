//
//  HeartObject.swift
//  NossoMeio
//
//  Created by Natan Rodrigues on 28/11/22.
//

import SpriteKit

class HeartObject: SKNode {
    var heart = SKSpriteNode()
    var isActive = true
    
    override init() {
        super.init()
        self.heart = SKSpriteNode(imageNamed: "coracaoVermelho")
        heart.anchorPoint = CGPoint(x: 0.5, y: 1)
//        heart.size = CGSize(width: 0.05, height: 0.07)
        heart.scale(to: CGSize(width: 0.04, height: 0.08))
        heart.position.y = 0.4
        self.addChild(heart)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPosition(heart point: CGFloat) {
        self.heart.position.x = point
    }
    
    func setTexture(heart action: SKAction) {
        self.heart.run(action)
    }
}
