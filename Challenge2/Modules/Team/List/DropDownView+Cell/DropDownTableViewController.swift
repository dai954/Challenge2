//
//  TeamListDropDownTableView.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/08.
//

import UIKit

class DropDownTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        
        view.addSubview(tableView)
        
        tableView.fillSuperview()
        
        tableView.register(DropDownTextFieldCell.self, forCellReuseIdentifier: DropDownTextFieldCell.cellId)
        tableView.register(DropDownCategoryCell.self, forCellReuseIdentifier: DropDownCategoryCell.cellId)
        tableView.register(DropDownSearchSegmentedCell.self, forCellReuseIdentifier: DropDownSearchSegmentedCell.cellId)
        tableView.register(DropDownSortSegmentedCell.self, forCellReuseIdentifier: DropDownSortSegmentedCell.cellId)
        tableView.register(DropDownSearchButtonCell.self, forCellReuseIdentifier: DropDownSearchButtonCell.cellId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = self.tableView.dequeueReusableCell(withIdentifier: DropDownTextFieldCell.cellId, for: indexPath) as! DropDownTextFieldCell
        case 1:
            cell = self.tableView.dequeueReusableCell(withIdentifier: DropDownCategoryCell.cellId, for: indexPath) as! DropDownCategoryCell
        case 2:
            cell = self.tableView.dequeueReusableCell(withIdentifier: DropDownSearchSegmentedCell.cellId, for: indexPath) as! DropDownSearchSegmentedCell
        case 3:
            cell = self.tableView.dequeueReusableCell(withIdentifier: DropDownSortSegmentedCell.cellId, for: indexPath) as! DropDownSortSegmentedCell
        default:
            cell = self.tableView.dequeueReusableCell(withIdentifier: DropDownSearchButtonCell.cellId, for: indexPath) as! DropDownSearchButtonCell
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath", indexPath)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
