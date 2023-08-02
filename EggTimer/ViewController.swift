//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft":3,"Medium":7,"Hard":12]

    
    var timer = Timer()
    var total = 0
    var timePassed = 0
    @IBAction func eggBtn(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        total = eggTimes[hardness]!
        progressBar.progress = 0.0
        timePassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if timePassed < total{
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(total)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}
