//
//  TeamListViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

import UIKit

class TeamListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let teamListCell = "teamListCell"
   
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.primaryGray()
        tableView.backgroundColor = UIColor.primaryGray()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.register(TeamListTableViewCell.self, forCellReuseIdentifier: teamListCell)
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: teamListCell, for: indexPath) as! DefaultTableViewCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
