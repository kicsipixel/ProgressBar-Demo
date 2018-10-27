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
    var percentLabelWidth: CGFloat = CGFloat()
    var percentLabelHeight: CGFloat = CGFloat()
    var percentLabelPositionX: CGFloat = CGFloat()
    var percentLabelPositionY: CGFloat = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get NSTextField position
        percentLabelWidth = percentLabel.frame.width
        percentLabelHeight = percentLabel.frame.height
        percentLabelPositionX = percentLabel.frame.origin.x
        percentLabelPositionY = percentLabel.frame.origin.y
        
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
        
        NSAnimationContext.runAnimationGroup({_ in
            NSAnimationContext.current.duration = 0
            percentLabel.animator().frame = CGRect(x: (CGFloat(slider.floatValue) * 134.0)+percentLabelPositionX, y: percentLabelPositionY, width: percentLabelWidth, height: percentLabelHeight)
        })
        
        percentLabel.textColor = NSColor(calibratedRed: 138.0/255.0, green: 156.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        
        if percentValue > 5.0 {
            percentLabel.textColor = .white
        }
    }
}

