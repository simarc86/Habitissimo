//
//  Color.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 19/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation
import UIKit

enum AssetsColor {
    case primary
    case selectedComponent
    case defaultComponent
    case placeholder
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .primary:
            return UIColor(named: "primaryColor")
        case .selectedComponent:
            return UIColor(named: "selectedBackgroundField")
        case .defaultComponent:
            return UIColor(named: "defaultBackgroundField")
        case .placeholder:
            return UIColor(named: "placeholder")
        }
    }
}
