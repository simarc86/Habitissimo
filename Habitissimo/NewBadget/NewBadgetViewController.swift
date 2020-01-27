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

    @IBOutlet weak var locationTableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var descriptionView: HTextView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var categoryButton: HButton!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var locationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter?.viewWillDisappear()
        super.viewWillDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        locationTableHeightConstraint?.constant = locationTableView.contentSize.height
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
    
    func updateLocationComponent(text: String) {
        locationTextField.text = text
        locationTableView.isHidden = true
    }
    
    func reloadLocation() {
        locationTableView.reloadData()
    }
    
    func showAlert(title: String, text: String) {
        let alert = UIAlertController.init(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        show(alert, sender: nil)
    }
    
    private func setupTableView() {
        locationTextField.delegate = self
        locationTableView.delegate = self
        locationTableView.dataSource = self
        locationTableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
    }

    @IBAction func categoryDidTap(_ sender: Any) {
        categoryButton.editingSetup()
        presenter?.requestCategory()
    }
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        presenter?.requestSave(
            customDescription: descriptionView.text,
            email: emailTextField.text,
            id: "",
            location: locationTextField.text,
            name: nameTextField.text,
            phone: phoneTextField.text
        )
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

extension NewBadgetViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.locations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = LocationTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? LocationTableViewCell else {
            return UITableViewCell()
        }
        let row = indexPath.row
        let location = presenter?.locations?[row]
        cell.textLabel?.text = location?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        presenter?.locationSelected(row:row)
    }
}

extension NewBadgetViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        locationTextField.textColor = ColorService.defaultTextColor
        locationTableView.isHidden = false
        presenter?.locationTextInput(text: text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        locationTableView.isHidden = true
    }
}
