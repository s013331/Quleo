//
//  GameScene.swift
//  Quleo
//
//  Created by Asher Dayanim (student LM) on 2/20/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import SpriteKit

class GameScene: SKScene{
    
    var player: SKSpriteNode!
    
    override func sceneDidLoad() {
        createPlayer()
    }
    
    override func didMove(to view: SKView) {
        createPlayer()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    func createPlayer() {
       let playerTexture = SKTexture(imageNamed: "frog1")
        player = SKSpriteNode(texture: playerTexture)
        player.zPosition = 10
        player.position = CGPoint(x: frame.width / 6, y: frame.height * 0.75)

        addChild(player)

        let frame2 = SKTexture(imageNamed: "frog2")
       let frame3 = SKTexture(imageNamed: "frog1")
        let animation = SKAction.animate(with: [playerTexture, frame2, frame3, frame2], timePerFrame: 0.01)
       let runForever = SKAction.repeatForever(animation)

        player.run(runForever)
    }
    
}
