//
//  ViewController.swift
//  ProgressBar Demo
//
//  Created by Szabolcs Toth on 10/26/18.
//  Copyright © 2018 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var progressBarView: ProgressBarView!
    @IBOutlet var slider: NSSlider!
    @IBOutlet var percentLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the Window background to white
        if self.view.layer != nil {
            let whiteColor = NSColor.white
            self.view.layer?.backgroundColor = whiteColor.cgColor
        }
    }

    @IBAction func sliderMoved(_ sender: Any) {
        progressBarView.progress = CGFloat(slider.floatValue)
        
        // Show the progess in percentage
        let percentValue = slider.floatValue / Float(slider.maxValue) * 100
        let percentValueString = String(format: "%.0f", percentValue)
        percentLabel.stringValue = "\(percentValueString)%"
        
    }
    
}

