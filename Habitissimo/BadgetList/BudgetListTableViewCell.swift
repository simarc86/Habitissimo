//
//  BudgetListTableViewCell.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 12/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit

class BudgetListTableViewCell: UITableViewCell {
    static let identifier = "BudgetListTableViewCellID"
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setup(_ budget: Budget?) {
        guard let budget = budget else {
            return
        }
        nameLabel?.text = budget.name
        phoneLabel.text = String(budget.phone)
        emailLabel.text = budget.email
        descriptionLabel.text = budget.customDescription
    }
}
