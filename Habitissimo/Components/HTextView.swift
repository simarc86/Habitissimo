//
//  HTextView.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 16/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit

class HTextView: UITextView {
    let placeholderColor: UIColor = .gray
    let defaultTextColor: UIColor = .black
    var isEdited = false
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        self.initalSetup()
    }
    
    func initalSetup(){
        textColor = placeholderColor
        text = "Descripción"
        isEdited = false
        self.layoutIfNeeded()
    }
    
    func editedSetup() {
        textColor = defaultTextColor
        text = ""
        isEdited = true
    }
}

extension HTextView: UITextViewDelegate {
    override func becomeFirstResponder() -> Bool {
        if !isEdited {
            editedSetup()
        }
        return super.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if text.isEmpty {
            initalSetup()
        }
    }
}
