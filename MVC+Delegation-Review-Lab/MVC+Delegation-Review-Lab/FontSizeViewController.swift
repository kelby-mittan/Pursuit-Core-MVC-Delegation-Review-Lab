//
//  FontSizeViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Kelby Mittan on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontSizeViewController: UIViewController {
    
    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var theStepper: UIStepper!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    var fontSize: Double = 17.0 {
        didSet {
            fontSizeLabel.text = "Font Size: \(Int(theStepper.value))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSizeLabel.text = "Font Size: 17"
        configureSlider()
        configureStepper()
        
    }
    
    func configureStepper() {
        theStepper.minimumValue = 17.0
        theStepper.maximumValue = 35.0
        theStepper.stepValue = 1.0
        // default start value
        theStepper.value = 17.0
    }
    
    func configureSlider() {
        theSlider.minimumValue = 17
        theSlider.maximumValue = 35
        theSlider.value = 17
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        fontSize = theStepper.value
        fontSizeLabel.font = UIFont.systemFont(ofSize: CGFloat(theStepper!.value))
        theSlider.value = Float(theStepper.value)
    }
    

}
