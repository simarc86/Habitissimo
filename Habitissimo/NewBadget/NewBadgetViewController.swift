//
//  NewBadgetViewController.swift
//  Habitissimo
//
//  Created Marc Tamarit on 15/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class NewBadgetViewController: UIViewController, NewBadgetViewProtocol {
	var presenter: NewBadgetPresenterProtocol?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var descriptionView: HTextView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var categoryButton: HButton!
    @IBOutlet weak var locationTextField: HTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func reloadCategories() {
        categoryPickerView.reloadAllComponents()
    }
    
    func showPicker(value: Bool) {
        categoryPickerView.isHidden = !value
    }
    
    func updateCategoryComponent(text: String) {
        categoryButton.updateTitle(text: text)
    }

    @IBAction func categoryDidTap(_ sender: Any) {
        categoryButton.editingSetup()
        presenter?.requestCategory()
    }
}
extension NewBadgetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numberOfRows = 0
        if component == 0 {
            numberOfRows = presenter?.categories?.count ?? 0
        } else {
            numberOfRows = presenter?.subcategories?.count ?? 0
        }
        return numberOfRows
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? HPickerLabel
        if (pickerLabel == nil) {
            pickerLabel = HPickerLabel()
        }
        
        if component == 0 {
            pickerLabel?.setup(text: presenter?.categories?[row].name, bold: true)
        } else {
            pickerLabel?.setup(text: presenter?.subcategories?[row].name, bold: false)
        }
        
        return pickerLabel ?? UIView()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            presenter?.categorySelected(index:row)
        case 1:
            presenter?.subcategorySelected(index:row)
        default:
            return
        }
    }
}


