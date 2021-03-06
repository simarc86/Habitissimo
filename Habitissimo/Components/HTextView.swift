//
//  HTextView.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 16/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit

class HTextView: UITextView {
    var isEdited = false

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        self.initalSetup()
    }
    
    func initalSetup(){
        textColor = ColorService.placeholderColor
        text = "Descripción"
        isEdited = false
        self.layoutIfNeeded()
    }
    
    func editedSetup() {
        textColor = ColorService.defaultTextColor
        text = ""
        isEdited = true
    }
}

extension HTextView: UITextViewDelegate {
    override func becomeFirstResponder() -> Bool {
        if !isEdited {
            editedSetup()
        }
        backgroundColor = ColorService.foucusedBackgroundColor
        return super.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if text.isEmpty {
            initalSetup()
        }
        backgroundColor = ColorService.defaultBackgoundColor
    }
}
