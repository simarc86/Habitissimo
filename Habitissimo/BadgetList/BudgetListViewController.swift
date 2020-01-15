//
//  BudgetListViewController.swift
//  Habitissimo
//
//  Created Marc Tamarit on 12/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class BudgetListViewController: UIViewController, BudgetListViewProtocol {
    var presenter: BudgetListPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setAddButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BudgetListTableViewCell.self, forCellReuseIdentifier: BudgetListTableViewCell.identifier)
    }

    func reloadData() {
        tableView.reloadData()
    }
    
    private func setAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc
    func addTapped() {
        presenter?.addTapped()
    }
}

extension BudgetListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.budgets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = BudgetListTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? BudgetListTableViewCell else {
            return UITableViewCell()
        }
        let row = indexPath.row
        let budget = presenter?.budgets?[row]
        cell.setup(budget)
        return cell
    }
}
