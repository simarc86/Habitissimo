//
//  HTextField.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 19/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit

class HTextField: UITextField {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        self.initalSetup()
    }
    
    func initalSetup(){
        textColor = ColorService.placeholderColor
        self.layoutIfNeeded()
    }
    
    func editedSetup() {
        textColor = ColorService.defaultTextColor
    }
}

extension HTextField: UITextFieldDelegate {
    override func becomeFirstResponder() -> Bool {
        backgroundColor = ColorService.foucusedBackgroundColor
        return super.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        backgroundColor = ColorService.defaultBackgoundColor
    }
}
