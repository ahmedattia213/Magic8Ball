//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Ahmed Amr on 1/19/18.
//  Copyright © 2018 Ahmed Amr. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    
    var backgroundMusic = AVAudioPlayer()
    var ballSound   = AVAudioPlayer()
    var x : Int = 0
    var randomNum : Int = 0
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
       ballSound.play()
      changeBallImage()
        x = randomNum
    }
    
    func changeBallImage(){
        while x == randomNum { // not the normal randomization , avoiding repitition
            randomNum = Int(arc4random_uniform(3)+1)
        }
        ballImage.image = UIImage(named: "ball\(randomNum)")
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            backgroundMusic = try! AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "backgroundMusic" , ofType: "wav")!))
            backgroundMusic.numberOfLoops = -1   
            backgroundMusic.prepareToPlay()
            backgroundMusic.play()
            
            ballSound = try! AVAudioPlayer(contentsOf : URL.init(fileURLWithPath: Bundle.main.path(forResource: "ballSound" , ofType: "wav")!))
            ballSound.prepareToPlay()
          
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        changeBallImage()
        ballSound.play()
        x = randomNum
    }

}

