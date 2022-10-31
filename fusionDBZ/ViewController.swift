//
//  ViewController.swift
//  fusionDBZ
//
//  Created by Émerson M Luz on 29/10/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pair: UIStackView!
    @IBOutlet weak var sgControl: UISegmentedControl!
    @IBOutlet weak var vegeta: UIImageView!
    @IBOutlet weak var goku: UIImageView!
    @IBOutlet weak var charFusion: UIImageView!
    @IBOutlet weak var shine: UIImageView!
    @IBOutlet weak var fusionEffect: UIImageView!
    @IBOutlet weak var lbFusion: UILabel!
    
    var sound = AVAudioPlayer()
    var effect = AVAudioPlayer()
    var soundOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
            let path = Bundle.main.path(forResource: "theme", ofType: "mp3")
            let pathEffect = Bundle.main.path(forResource: "soundEffect", ofType: "mp3")
            
            try sound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
            try effect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathEffect!))
        } catch {
            print("Ost não encontrado")
        }
        
        sound.play()
        
    }
    

    @IBAction func starFusion (_ sender: Any) {
        
        guard charFusion.alpha < 1 else {
            shine.alpha = 0
            fusionEffect.alpha = 0
            vegeta.alpha = 0
            goku.alpha = 0
            return
        }
        
        animation()
        
        Timer.scheduledTimer(withTimeInterval: 0.008, repeats: false, block: starFusion(_:))
    }
    
    @IBAction func chooseFusion(_ sender: Any) {
        
        reset()
        
        if sgControl.selectedSegmentIndex == 0 {
            charFusion.image = UIImage(named: "vegeto")
        } else {
            charFusion.image = UIImage(named: "gogeta")
        }
    }
    
    func animation () {
        
        if pair.spacing > 0 {
            pair.spacing -= 1
        } else {
            charFusion.alpha += 0.01
            vegeta.alpha -= 0.02
            goku.alpha -= 0.02
        }
        
        if pair.spacing < 10 {
            if shine.alpha < 1 {
                shine.alpha = 1
                fusionEffect.alpha = 1
                lbFusion.alpha = 1
            } else {
                shine.alpha = 0
                fusionEffect.alpha = 0
                lbFusion.alpha = 0
            }
            if effect.play() != true {
                effect.play()
            }
        }
    }
    
    func reset () {
        charFusion.alpha = 0
        vegeta.alpha = 1
        goku.alpha = 1
        shine.alpha = 0
        fusionEffect.alpha = 0
        pair.spacing = 50
    }
    
    
   
    
}

