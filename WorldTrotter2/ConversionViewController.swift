//
//  ViewController.swift
//  WorldTrotter2
//
//  Created by Chris Mazurek on 9/30/25.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("ConversionViewController loaded its view.")
    }

    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        celsiusLabel.text = textField.text
    }
}


