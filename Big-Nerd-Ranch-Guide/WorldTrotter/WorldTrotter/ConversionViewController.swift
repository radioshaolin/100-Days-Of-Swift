//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Radio Shaolin on 03.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
        }()
    
    @IBOutlet var fahrengheitTextField: UITextField!
    @IBOutlet var celsiusTextField: UILabel!

    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = fahrengheitTextField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrengheitTextField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusTextField.text =
                numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusTextField.text = "???"
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let letterCharacters = NSCharacterSet.letters
        let spaceCharacters = NSCharacterSet.whitespacesAndNewlines
        let punctuationAndSpecialCharacters = CharacterSet.init(charactersIn: "!#$&@~()[];,<>/?*|'\'" )
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        let containLetterCharacter = string.rangeOfCharacter(from: letterCharacters)
        let containSpacesAndNewLineCharacters = string.rangeOfCharacter(from: spaceCharacters)
        let containPunctuationAndSpecialCharacters = string.rangeOfCharacter(from: punctuationAndSpecialCharacters)
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else if containLetterCharacter != nil {
            return false
        } else if containSpacesAndNewLineCharacters != nil {
            return false
        } else if containPunctuationAndSpecialCharacters != nil {
            return false
        } else {
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fahrenheitValue = Measurement(value: 100, unit: .fahrenheit)
    }
    
}


