//
//  GameScene.swift
//  Quleo
//
//  Created by Asher Dayanim (student LM) on 2/20/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import SpriteKit

enum GameState {
    case begin
    case playing
    case dead
}

class GameScene1: SKScene{
    
    var player: SKSpriteNode!
     var clicked = 1
    var gameState = GameState.begin
    var logo: SKSpriteNode!
    
//    override func sceneDidLoad() {
//        createPlayer()
//    }
    
    override func didMove(to view: SKView) {
        createLogos()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch gameState {
        case .begin:
            //fade out the starting screen
            let fadeOut = SKAction.fadeOut(withDuration: 0.5)
            let remove = SKAction.removeFromParent()
            let wait = SKAction.wait(forDuration: 0.5)
            let sequence = SKAction.sequence([fadeOut, wait, remove])
            logo.run(sequence)
            createPlayer()
            player.zPosition = 10
            gameState = .playing
            createBackground()

            break;
      
        case .playing:
   
        if clicked > 0 {
            player.position.x = 300
        }
        else {
            player.position.x = 60
        }
        clicked *= -1
        break;
        case .dead:
            //uh oh!
            break;
    }
        
    }
    
    func createPlayer() {
       let playerTexture = SKTexture(imageNamed: "frog1")
        player = SKSpriteNode(texture: playerTexture)
        player.zPosition = -40
        player.position = CGPoint(x: 60, y: 160)

        addChild(player)
        print("child added")
        let frame2 = SKTexture(imageNamed: "frog2")
       let frame3 = SKTexture(imageNamed: "frog1")
        let animation = SKAction.animate(with: [playerTexture, frame2, frame3, frame2], timePerFrame: 0.5)
       let runForever = SKAction.repeatForever(animation)

        player.run(runForever)
    }
    
    func createBackground() {
        let backgroundTexture = SKTexture(imageNamed: "treez")

            let background = SKSpriteNode(texture: backgroundTexture)
            background.zPosition = -30
        
            for i in 0 ... 1 {
                let background = SKSpriteNode(texture: backgroundTexture)
                background.zPosition = -30
                background.anchorPoint = CGPoint.zero
                background.position = CGPoint(x: 0, y: (backgroundTexture.size().height * CGFloat(i)) - CGFloat(1 * i))
                addChild(background)
                let moveDown = SKAction.moveBy(x: 0, y:-backgroundTexture.size().height, duration: 10)
                let moveReset = SKAction.moveBy(x: 0, y: backgroundTexture.size().height, duration: 0)
                let moveLoop = SKAction.sequence([moveDown, moveReset])
                let moveForever = SKAction.repeatForever(moveLoop)
                background.run(moveForever)
            }
        }
  
    func createLogos() {
        logo = SKSpriteNode(imageNamed: "iowa")
        logo.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(logo)
        
//        gameOver = SKSpriteNode(imageNamed: "gameover")
//        gameOver.position = CGPoint(x: frame.midX, y: frame.midY)
//        gameOver.alpha = 0
//        addChild(gameOver)
    }
}
