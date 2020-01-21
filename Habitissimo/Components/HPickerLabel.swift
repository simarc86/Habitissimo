//
//  HPickerLabel.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 20/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit

class HPickerLabel: UILabel {
    let fontSize: CGFloat = 16.0
    
    func setup(text: String?, bold: Bool) {
        textAlignment = NSTextAlignment.center
        font = bold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.text = text
    }
}
