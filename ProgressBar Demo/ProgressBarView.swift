//
//  ProgressBarView.swift
//  ProgressBar Demo
//
//  Created by Szabolcs Toth on 10/26/18.
//  Copyright © 2018 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ProgressBarView: NSView {
    
    private var _innerProgress: CGFloat = 0.0
    
    var progress: CGFloat {
        set (newProgress) {
            if newProgress > 1.0 {
                _innerProgress = 1.0
            } else if newProgress < 0.0 {
                _innerProgress = 0.0
            } else {
                _innerProgress = newProgress
            }
            setNeedsDisplay(bounds)
        }
        get {
            return _innerProgress * bounds.width
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        ProgressBarDraw.drawProgressBar(frame: bounds, progress: progress)
    }
    
}
