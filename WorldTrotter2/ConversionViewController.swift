//
//  ViewController.swift
//  WorldTrotter2
//
//  Created by Chris Mazurek on 9/30/25.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet {
            updateCelsiusLabel()
        }
    }
    
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("ConversionViewController loaded its view.")
        
        updateCelsiusLabel()
    }

    
    func updateCelsiusLabel() {
        
        if let celsiusValue = celsiusValue {
            celsiusLabel.text =
                        numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
                fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
            } else {
                fahrenheitValue = nil
            }
    }
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }

}


