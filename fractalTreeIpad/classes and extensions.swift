//
//  classes and extensions.swift
//  fractalTreeIpad
//
//  Created by alessandra leventhal on 20/03/2018.
//  Copyright © 2018 ariel. All rights reserved.
//

import UIKit
class LabeledSlider : UISlider {
    var label : UILabel?

    
    
}

class percentageLabel : UILabel {
    override var text: String? {
        didSet {
            if let double = Double(self.text!){
                let int = Int(double * 100)
                self.text = String(int) + "%"
            }
        }
    }
}
