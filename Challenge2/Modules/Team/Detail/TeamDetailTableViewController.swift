//
//  TeamDetailCollectionViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import UIKit

class TeamDetailTableViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let paddingDummyView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.constrainHeight(constant: 30)
        return view
    }()
    let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.hidesBarsOnSwipe = true
        
        view.backgroundColor = UIColor.primaryGray()
        tableView.backgroundColor = UIColor.primaryGray()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        tableView.register(TeamDetailImageCell.self, forCellReuseIdentifier: TeamDetailImageCell.teamDetailCellId)
        tableView.register(AchievementRateCell.self, forCellReuseIdentifier: AchievementRateCell.cellId)
        tableView.register(DetailDescriptionCell.self, forCellReuseIdentifier: DetailDescriptionCell.cellId)
        tableView.register(DetailScreenshotCell.self, forCellReuseIdentifier: DetailScreenshotCell.cellId)
        tableView.register(DetailInfoCell.self, forCellReuseIdentifier: DetailInfoCell.cellId)
        tableView.register(FavoriteRegisterCell.self, forCellReuseIdentifier: FavoriteRegisterCell.cellId)
        tableView.register(ReportButtonCell.self, forCellReuseIdentifier: ReportButtonCell.cellId)
        
        view.addSubview(tableView)
        view.addSubview(bottomView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: bottomView.topAnchor, trailing: view.trailingAnchor)
        bottomView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 150))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "hello"
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TeamDetailImageCell.teamDetailCellId, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AchievementRateCell.cellId, for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailDescriptionCell.cellId, for: indexPath)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenshotCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteRegisterCell.cellId, for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReportButtonCell.cellId, for: indexPath)
            cell.separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        default:
            return cell
        }

    }

    
}
