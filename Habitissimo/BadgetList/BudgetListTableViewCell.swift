//
//  BudgetListTableViewCell.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 12/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit

class BudgetListTableViewCell: UITableViewCell {
    static let identifier = "BudgetListTableViewCell"
    
    func setup(_ budget: Budget?) {
        guard let budget = budget else { return }
        textLabel?.text = budget.name
    }
}
