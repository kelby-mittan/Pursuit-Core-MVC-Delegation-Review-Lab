//
//  FontSizeViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Kelby Mittan on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

protocol FontSize: AnyObject {
    func changedFontSize(_ size: CGFloat)
}

class FontSizeViewController: UIViewController {
    
    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var theStepper: UIStepper!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    weak var sizeDelegate: FontSize?
    
    var fontSize: Double = 17.0 {
        didSet {
            fontSizeLabel.text = "Font Size: \(Int(theStepper.value))"
            sizeDelegate?.changedFontSize(CGFloat(fontSize))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSizeLabel.text = "Font Size: 17"
        configureSlider()
        configureStepper()
        theSlider.isEnabled = false
        
    }
    
    func configureStepper() {
        theStepper.minimumValue = 1.0
        theStepper.maximumValue = 45.0
        theStepper.stepValue = 2.0
        
        theStepper.value = 17.0
    }
    
    func configureSlider() {
        theSlider.minimumValue = 1
        theSlider.maximumValue = 45
        theSlider.value = 17
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        fontSize = theStepper.value
        fontSizeLabel.font = UIFont.systemFont(ofSize: CGFloat(theStepper!.value))
        theSlider.value = Float(theStepper.value)
    }
    

}
