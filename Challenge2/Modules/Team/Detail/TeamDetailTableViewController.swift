//
//  TeamDetailCollectionViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/05.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TeamDetailTableViewController: ViewController {
    
    deinit {
        print("TeamDetailTableViewController deinit")
    }

    let tableView = UITableView()
    let bottomView = BottomView()
    var viewModel: TeamDetailViewModel!

    init(viewModel: TeamDetailViewModel) {
        print("TeamDetailTableViewController init")
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnSwipe = true
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
        tabBarController?.tabBar.isHidden = false
    }

    override func makeUI() {
        super.makeUI()
        view.backgroundColor = UIColor.primaryGray()
        tableView.backgroundColor = UIColor.primaryGray()

        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.contentInset = .init(top: 0, left: 0, bottom: 150, right: 0)
        tableView.allowsSelection = false

        tableView.register(TeamDetailImageCell.self, forCellReuseIdentifier: TeamDetailImageCell.teamDetailImageCellId)
        tableView.register(AchievementRateCell.self, forCellReuseIdentifier: AchievementRateCell.cellId)
        tableView.register(DetailDescriptionCell.self, forCellReuseIdentifier: DetailDescriptionCell.cellId)
        tableView.register(DetailScreenshotCell.self, forCellReuseIdentifier: DetailScreenshotCell.cellId)
        tableView.register(DetailInfoCell.self, forCellReuseIdentifier: DetailInfoCell.cellId)
        tableView.register(FavoriteRegisterCell.self, forCellReuseIdentifier: FavoriteRegisterCell.cellId)
        tableView.register(ReportButtonCell.self, forCellReuseIdentifier: ReportButtonCell.cellId)

        view.addSubview(tableView)
        view.addSubview(bottomView)

        tableView.fillSuperview()
        bottomView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 150))
    }

    override func bindViewModel() {
        super.bindViewModel()
        let dataSource = RxTableViewSectionedReloadDataSource<TeamDetailSection> { dataSource, tableView, indexPath, teamSectionItem in
            switch teamSectionItem {
            case .teamImage(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: TeamDetailImageCell.teamDetailImageCellId, for: indexPath) as! TeamDetailImageCell
                cell.bind(to: viewModel)
                return cell
            case .achievementRate(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: AchievementRateCell.cellId , for: indexPath) as! AchievementRateCell
                cell.bind(to: viewModel)
                return cell
            case .description(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: DetailDescriptionCell.cellId, for: indexPath) as! DetailDescriptionCell
                cell.bind(to: viewModel)
                return cell
            case .screenshots(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: DetailScreenshotCell.cellId, for: indexPath) as! DetailScreenshotCell
                cell.bind(to: viewModel)
                return cell
            case .dateInfo(let viewModel), .ageInfo(let viewModel), .sexInfo(let viewModel), .termInfo(let viewModel), .autoExitTermInfo(let viewModel), .assistantInfo(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.cellId, for: indexPath) as! DetailInfoCell
                cell.bind(to: viewModel)
                return cell
            case .favorite(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteRegisterCell.cellId, for: indexPath) as! FavoriteRegisterCell
                cell.bind(to: viewModel)
                return cell
            case .report(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: ReportButtonCell.cellId, for: indexPath) as! ReportButtonCell
                cell.separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                cell.bind(to: viewModel)
                return cell
            }
        }

        let input = TeamDetailViewModel.Input(willDisplayCellEvent: tableView.rx.willDisplayCell.asDriver())
        let output = viewModel.transform(input: input)
        
        output.teamDetailSections
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

}
