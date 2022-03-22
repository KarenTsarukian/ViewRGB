//
//  ColorViewController.swift
//  ViewRGB
//
//  Created by Karen Tsarukian on 30.01.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var viewMulticolor: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var multicolorBackground: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewMulticolor.layer.cornerRadius = 15
        viewMulticolor.backgroundColor = multicolorBackground
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTF.text = redLabel.text
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTF.text = redLabel.text
        default:
            blueLabel.text = string(from: blueSlider)
            blueTF.text = blueLabel.text
        }
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func setColor() {
        viewMulticolor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}
