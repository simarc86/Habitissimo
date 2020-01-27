//
//  CheckService.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 26/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

class CheckService {
    class func isPhoneFormat(text: String) -> Bool {
        return Int64(text) != nil
    }
    
    class func isEmailFormat(text: String) -> Bool {
        return text.contains("@") && text.contains(".")
    }
}
