
//  TrashObject.swift
//  NossoMeio
//
//  Created by Natan Rodrigues on 20/11/22.

import SpriteKit

class JunkObject: SKNode {
    
    private var image: SKSpriteNode
    var positionPoint: CGPoint
    var junk: SKSpriteNode
    var body: SKPhysicsBody
    private var junkType: JunkType
    private var actionMoved: ((_ touches: Set<UITouch>) -> Void)?
    private var actionEndMoved: ((_ touches: Set<UITouch>) -> Void)?
    
    enum ActionType {
        case moved, endMoved
    }
    
    enum JunkType {
        case plastic, organic, glass, metal, paper
    }
    
    init(image: SKSpriteNode, positionPoint: CGPoint, junkType: JunkType, body: SKPhysicsBody){
        self.image = image
        self.positionPoint = positionPoint
        self.junkType = junkType
        self.junk = SKSpriteNode()
        self.body = body
        super.init()
        self.isUserInteractionEnabled = true
        
        self.junk.addChild(image)
        self.junk.position = positionPoint
        self.junk.size = CGSize(width: 10, height: 10)
        self.junk.physicsBody = body
        self.addChild(junk)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    
    func setActionMoved(action type: ActionType, _ action: @escaping (_ touches: Set<UITouch>) -> Void) {
        switch type {
        case .moved:
            self.actionMoved = action
        case .endMoved:
            self.actionEndMoved = action
        }
    }

    func setTypeJunk(junkType type: JunkType) {
        self.junkType = type
    }
    
    func setPosition(positionPoint point: CGPoint) {
        self.junk.position = point
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.actionMoved?(touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.actionMoved?(touches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.actionEndMoved?(touches)
    }
}
