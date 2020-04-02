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
    var NWbox : SKSpriteNode!
    var box : SKSpriteNode!
    var question : SKLabelNode!
    var NEbox : SKSpriteNode!
    var SWbox : SKSpriteNode!
    var SEbox : SKSpriteNode!
     var SEanswer : SKLabelNode!
     var NEanswer : SKLabelNode!
    var NWanswer : SKLabelNode!
    var SWanswer : SKLabelNode!
    var indexes: [Int] = []
     var clicked = 1
    var gameState = GameState.begin
    var logo: SKSpriteNode!
    var list : [String : String] = ["Asher":"Dayanim", "Robert": "Silver", "Cece":"Ray", "Jake":"Ridgeway", "Mr. ":"Swope"] //needs to be a global variable
    var terms : [String] = []
    var definitions : [String] = []
    var choice = 0
    var StringChoice = ""
    var timer = Timer()
    var warningSign : SKSpriteNode!
    var hit = false
    var score = 0 //needs to be a global variable
    var scoreLabel : SKLabelNode!
    var replayButton : SKSpriteNode!
    var deathScreen : SKSpriteNode!
    
    
//    override func sceneDidLoad() {
//        createPlayer()
//    }
    
    override func didMove(to view: SKView) {
        createLogos()
        createBackground1()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch gameState {
        case .begin:
            //fade out the starting screen
            let fadeOut = SKAction.fadeOut(withDuration: 0.5)
            let remove = SKAction.removeFromParent()
            let wait = SKAction.wait(forDuration: 0.5)
            let sequence = SKAction.sequence([fadeOut, wait, remove])
            score = 0
            logo.run(sequence)
            removeAllChildren()
            createPlayer()
            player.zPosition = 10
            displayScore()
          
            timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(addWarning), userInfo: nil, repeats: true)
            
            for (term, definition) in list {
                terms.append(term)
                definitions.append(definition)
            }
            
            createBox()
            gameState = .playing
            createBackground1()

        break;
      
        case .playing:

        for touch in touches {
                 let location = touch.location(in: self)
                 let touchedNode = atPoint(location)
            
            if (touchedNode.name ==  (StringChoice + "box") || touchedNode.name == (StringChoice + "answer")) && clicked > 0 {
                     player.position.x = 300
                    clicked *= -1
               updateScore()
                
                 }
                 else if  (touchedNode.name ==  (StringChoice + "box") || touchedNode.name == (StringChoice + "answer")) && clicked < 0 {
                    player.position.x = 80
                    clicked *= -1
                updateScore()
                }
                
            NWanswer.removeFromParent()
            NEanswer.removeFromParent()
            SWanswer.removeFromParent()
            SEanswer.removeFromParent()
            question.removeFromParent()
            indexes.removeAll()
            createBox()
            }
            break;
            
        case .dead:
            //uh oh!
            timer.invalidate()
            removeAllChildren()
            createDeathScreen()
            displayScore()
           // makeReplayButton()
             
           // for touch in touches {
                //timer.invalidate()
                //let location = touch.location(in: self)
//                let touchedNode = atPoint(location)
//
//                if touchedNode.name == "replay" {
//                    removeAllChildren()
//                     hit = false
                    
                    
//                     createLogos()
//                    createBackground1()
//                    gameState = .begin
                    
                    
     //           }
    //        }

            break;
    }
        
    }
    
    func createPlayer() {
       let playerTexture = SKTexture(imageNamed: "frog1")
        player = SKSpriteNode(texture: playerTexture)
        player.zPosition = -40
        player.position = CGPoint(x: 80, y: 360)

        addChild(player)
        print("child added")
        let frame2 = SKTexture(imageNamed: "frog2")
       let frame3 = SKTexture(imageNamed: "frog1")
        let animation = SKAction.animate(with: [playerTexture, frame2, frame3, frame2], timePerFrame: 0.5)
       let runForever = SKAction.repeatForever(animation)

        player.run(runForever)
    }
    

    
    func createBackground1() {
        let backgroundTexture = SKTexture(imageNamed: "background")

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
                if gameState == GameState.playing {
                background.run(moveForever)
                }
            }
        }
  
    func createLogos() {
        logo = SKSpriteNode(imageNamed: "frog")
        logo.position = CGPoint(x: 80, y: 370)
        addChild(logo)
        
//        gameOver = SKSpriteNode(imageNamed: "gameover")
//        gameOver.position = CGPoint(x: frame.midX, y: frame.midY)
//        gameOver.alpha = 0
//        addChild(gameOver)
    }
    
    
    func createBox(){
        
        choice = Int.random(in: 0..<terms.count)
        indexes.append(choice)
      
        repeat{
            var newIndex = Int.random(in: 0..<terms.count)
                     if !indexes.contains(newIndex){
                         indexes.append(newIndex)
                     }
                 }
            
            while (indexes.count < 4)
        print(indexes)
        indexes.shuffle()
        
     //initialize boxes
       box = SKSpriteNode(color: UIColor(hue: 0.15, saturation: 0.14, brightness: 0.97, alpha: 1), size: CGSize(width: frame.width - 20, height: frame.height * 0.4))
        box.position = CGPoint(x: frame.midX, y: 100)
        box.zPosition = 10
        box.name = "box"
        
        question = SKLabelNode(text: terms[choice])
        question.fontName = "Cambria"
        question.fontSize =  20
        question.fontColor = UIColor.black
        question.position = CGPoint(x: frame.midX, y: 190)
        question.zPosition = 50
        question.name = "question"
        
      //  if gameState == .begin {
        addChild(box)
        addChild(question)
       // }
        NWbox = SKSpriteNode(color: UIColor(hue: 0.55, saturation: 0.14, brightness: 0.97, alpha: 1), size: CGSize(width: (frame.width - 40)/2, height: frame.height * 0.1))
        NWbox.position = CGPoint(x: frame.midX - frame.midX/2, y: 130)
        NWbox.zPosition = 40
        NWbox.name = "NWbox"
        
        NWanswer = SKLabelNode(text: definitions[indexes[0]])
            NWanswer.fontName = "Cambria"
             NWanswer.fontSize =  10
             NWanswer.fontColor = UIColor.black
            NWanswer.position = CGPoint(x: frame.midX - frame.midX/2, y: 150)
             NWanswer.zPosition = 50
        NWanswer.name = "NWanswer"
       
        if definitions[indexes[0]] == definitions[choice] {
            StringChoice = "NW"
        }
        
    // if gameState == .begin {
        addChild(NWanswer)
        addChild(NWbox)
        //}
        
        SWbox = SKSpriteNode(color: UIColor(hue: 0.65, saturation: 0.14, brightness: 0.97, alpha: 1), size: CGSize(width: (frame.width - 40)/2, height: frame.height * 0.1))
        SWbox.position = CGPoint(x: frame.midX - frame.midX/2, y: 50)
        SWbox.zPosition = 40
        SWbox.name = "SWbox"
        
        SWanswer = SKLabelNode(text: definitions[indexes[1]])
                   SWanswer.fontName = "Cambria"
                   SWanswer.fontSize =  10
                   SWanswer.fontColor = UIColor.black
                  SWanswer.position = CGPoint(x: frame.midX - frame.midX/2, y: 70)
                   SWanswer.zPosition = 50
        SWanswer.name = "SWanswer"
        
        if definitions[indexes[1]] == definitions[choice] {
                  StringChoice = "SW"
              }
              
     //   if gameState == .begin {
        addChild(SWanswer)
        addChild(SWbox)
       // }
        
        
        NEbox = SKSpriteNode(color: UIColor(hue: 0.75, saturation: 0.14, brightness: 0.97, alpha: 1), size: CGSize(width: (frame.width - 40)/2, height: frame.height * 0.1))
        NEbox.position = CGPoint(x: frame.midX + frame.midX/2, y: 130)
        NEbox.zPosition = 30
        NEbox.name = "NEbox"
        NEanswer = SKLabelNode(text: definitions[indexes[2]])
                  NEanswer.fontName = "Cambria"
                   NEanswer.fontSize =  10
                   NEanswer.fontColor = UIColor.black
                  NEanswer.position = CGPoint(x: frame.midX + frame.midX/2, y: 150)
                 NEanswer.zPosition = 50
        NEanswer.name = "NEanswer"
        
        if definitions[indexes[2]] == definitions[choice] {
                  StringChoice = "NE"
              }
        
        //if gameState == .begin {
        addChild(NEanswer)
        addChild(NEbox)
       //}
        
        SEbox = SKSpriteNode(color: UIColor(hue: 0.95, saturation: 0.14, brightness: 0.97, alpha: 1), size: CGSize(width: (frame.width - 40)/2, height: frame.height * 0.1))
        SEbox.position = CGPoint(x: frame.midX + frame.midX/2, y: 50)
        SEbox.zPosition = 30
        SEbox.name = "SEbox"
        SEanswer = SKLabelNode(text: definitions[indexes[3]])
                   SEanswer.fontName = "Cambria"
                   SEanswer.fontSize =  10
                   SEanswer.fontColor = UIColor.black
                 SEanswer.position = CGPoint(x: frame.midX + frame.midX/2, y: 70)
                   SEanswer.zPosition = 50
        SEanswer.name = "SEanswer"
        
        if definitions[indexes[3]] == definitions[choice] {
                  StringChoice = "SE"
              }
              
        //if gameState == .begin {
        addChild(SEanswer)
        addChild(SEbox)
        //}
    }
    
    @objc func addWarning(){
            warningSign = SKSpriteNode(imageNamed: "warning-1")
        var location = Int.random(in: 1...2)
        if location % 2 == 0 {
            warningSign.position = CGPoint(x: 80, y: 650)
        }
        else {
            warningSign.position = CGPoint(x: 300, y: 650)
            }
        
            warningSign.zPosition = 0
        addChild(warningSign)
         timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(addObstacle), userInfo: nil, repeats: false)
        if self.hit {
            timer.invalidate()
            warningSign.removeFromParent()
        }
        
    }

    @objc func addObstacle(){
        let location = warningSign.position
        warningSign.removeFromParent()
        var obstacles =  [SKSpriteNode]()
        obstacles.append(SKSpriteNode(imageNamed: "chainsaw"))
        obstacles.append(SKSpriteNode(imageNamed: "piano"))
        obstacles.append(SKSpriteNode(imageNamed: "acorn"))
        let rand = Int.random(in: 0...2)
        obstacles[rand].position = location
        obstacles[rand].zPosition = 10
        addChild(obstacles[rand])
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            obstacles[rand].position.y -= 50
            
            if obstacles[rand].position.x == self.player.position.x && obstacles[rand].position.y < 450 {
                self.hit = true
            }
            
            if self.hit {
                timer.invalidate()
                let explosion = SKSpriteNode(imageNamed: "explosion")
                explosion.position = self.player.position
                explosion.zPosition = 60
                self.addChild(explosion)
                obstacles[rand].removeFromParent()
                self.gameState = .dead
            }
               else if obstacles[rand].position.y < 320  {
                timer.invalidate()
                obstacles[rand].removeFromParent()
            }
        }
        
    }
    
    func displayScore() {
        
        scoreLabel = SKLabelNode(text: "Score = \(self.score)")
       scoreLabel.position = CGPoint(x: frame.midX, y: 550)
        scoreLabel.zPosition = 50
        scoreLabel.fontName = "Cambria"
        scoreLabel.fontSize =  40
        scoreLabel.fontColor = UIColor.red
        addChild(scoreLabel)
        
    }
    
    func updateScore() {
        score += 1
        scoreLabel.text = "Score = \(score)"
    }
    
    func makeReplayButton(){
        replayButton = SKSpriteNode(imageNamed: "replay" )
         replayButton.position = CGPoint(x: frame.midX, y: 50)
        replayButton.zPosition = 50
        replayButton.name = "replay"
        addChild(replayButton)
    }
    
    func createDeathScreen(){
        deathScreen = SKSpriteNode(imageNamed: "death")
        deathScreen.position = CGPoint(x: frame.midX, y: frame.midY)
        deathScreen.zPosition = 0
        addChild(deathScreen)
    }
    
    
}
