//
//  BackEndViewController.swift
//  TestTask-Funbox
//
//  Created by admin on 29.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BackEndViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    let tableCell = "BackEndTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: tableCell, bundle: nil), forCellReuseIdentifier: BackEndTableViewCell.reuseId)
    }

}

extension BackEndViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: BackEndTableViewCell.reuseId, for: indexPath) as? BackEndTableViewCell
        guard let cell = tableCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = "Nokia"
        cell.countLabel.text = "2 шт"
        return cell
    }
}

extension BackEndViewController: UITableViewDelegate {
    
}
