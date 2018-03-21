//
//  SettingsViewController.swift
//  fractalTreeIpad
//
//  Created by alessandra leventhal on 20/03/2018.
//  Copyright © 2018 ariel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet var labelCollection: [UILabel]!
    @IBOutlet var sliderCollection: [LabeledSlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index,slider) in sliderCollection.enumerated() {
            slider.label = labelCollection[index]
            var value = String(slider.value)
            if slider.tag == 0 {
                value = String(describing: Int(Float(value)!))
            }
            slider.label?.text = value
        }
    }
    
    @IBAction func sliderChangedValue(_ sender: LabeledSlider) {
        print("willChange")
        if sender.tag == 0 {
            let value = roundf(sender.value)
            if value != sender.value{
                sender.value = value
            }
            sender.label?.text = String(Int(sender.value))
            return
        }
        sender.label?.text = String(sender.value)
    }
    
    @IBAction func presentTouched(_ sender: UIButton) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "display") as! ViewController
        viewController.angle = Double(sliderCollection[0].value)
        viewController.length = Double(sliderCollection[1].value)
        viewController.initialLength = Double(sliderCollection[2].value)
        viewController.maxLength = Double(sliderCollection[3].value)
        viewController.initialAngle = Double(sliderCollection[4].value + 90)
        viewController.initialY = CGFloat(sliderCollection[5].value)
        viewController.initialX = CGFloat(sliderCollection[6].value)
        self.present(viewController, animated: true, completion: nil)
        
    }
}
