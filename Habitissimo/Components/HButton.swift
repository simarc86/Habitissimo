//
//  HButton.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 19/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit

class HButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalSetup()
    }
    
    private func initalSetup(){
        setTitleColor(ColorService.placeholderColor, for: .normal)
        setTitle("Tap for select", for: .normal)
        self.layoutIfNeeded()
    }
    
    func editedSetup() {
        setTitleColor(ColorService.defaultTextColor, for: .normal)
        backgroundColor = ColorService.defaultBackgoundColor
    }
    
    func updateTitle(text: String) {
        editedSetup()
        setTitle(text, for: .normal)
    }
    
    func editingSetup() {
        backgroundColor = ColorService.foucusedBackgroundColor
    }
}
