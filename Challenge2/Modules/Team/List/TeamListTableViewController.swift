//
//  TeamListViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/27.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TeamListTableViewController: ViewController {
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    var viewModel: TeamListViewModel!
    
    init(viewModel: TeamListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        bindViewModel()
    }
    
//    to transition back to previous screen smoothly
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.view.setNeedsLayout()
        navigationController?.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
//        self.dummyTableViewController.view.removeFromSuperview()
        
        dropDownFloatingView.floatingViewYPosition = dropDownFloatingView.frame.maxY
        dropDownFloatingView.safeAreaInsetsTop = view.safeAreaInsets.top

    }
    
    private func makeUI() {
        view.backgroundColor = UIColor.primaryGray()
        tableView.backgroundColor = UIColor.primaryGray()
        tableView.delegate = self
        tableView.refreshControl = refreshControl
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
        
        tableView.register(TeamListTableViewCell.self, forCellReuseIdentifier: TeamListTableViewCell.teamListCell)
        
        view.addSubview(addButton)
        view.addSubview(tableView)
        addButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 6))
        tableView.fillSuperview()
        
        setupFloatingView()
    }
    
    private func bindViewModel() {
        let dataSource = RxTableViewSectionedReloadDataSource<TeamListSection> { dataSource, tableView, indexPath, cellViewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: TeamListTableViewCell.teamListCell, for: indexPath) as! TeamListTableViewCell
            cell.bind(to: cellViewModel)
            return cell
        }
        
        let input = TeamListViewModel.Input(viewLayoutEvent: rx.viewWillAppear.mapToVoid(),
                                            selection: tableView.rx.modelSelected(TeamListCellViewModel.self).asObservable(),
                                            refreshControlEvent: refreshControl.rx.controlEvent(.valueChanged).mapToVoid()
        )
        
        let output = viewModel.transform(input: input)
        output.viewModelSections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        output.teamSelected
            .subscribe(onNext: { viewModel in
                let vc = TeamDetailTableViewController(viewModel: viewModel)
                vc.navigationItem.title = self.viewModel.keyword.value
                self.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        
        output.refreshing
            .bind(to: refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)
        
        output.numberOfTeam
            .bind(to: dropDownFloatingView.teamNumberlabel.rx.text)
            .disposed(by: disposeBag)
        
    }
    
    
    static let floatingViewHeight: CGFloat = 42
    let dropDownFloatingView: DropDownFloatingView = DropDownFloatingView()
    private func setupFloatingView() {
        view.addSubview(dropDownFloatingView)
        dropDownFloatingView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: TeamListTableViewController.floatingViewHeight))
//        calculateTableViewContentHeight(dropDownFloatingView: dropDownFloatingView)
    }
    
    var firstPosition: CGFloat = 0  //to determin scroll down or up
    var lastPosition: CGFloat = 0   //to determin scroll down or up
    var position: CGFloat = 0   //position value is between 0 to "floting view height"
    var accuracy: CGFloat = 3   //How mach speed to hide floting view
    var flag = true // to get scroll fisrt position
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if flag {
            firstPosition = scrollView.contentOffset.y
            flag = false
        }

        let isScrollingDown = isScrollDown(scrollView: scrollView)

        if !(scrollView.contentOffset.y >= firstPosition && scrollView.contentOffset.y < firstPosition) {
            if isScrollingDown && position > -TeamListTableViewController.floatingViewHeight && scrollView.contentOffset.y > firstPosition {
//                "scrollView.contentOffset.y > firstPosition" term is to prevent bad move at the top positon.
                    position -= accuracy
                    dropDownFloatingView.transform = .init(translationX: 0, y: position)
                } else if !isScrollingDown && position < 0 {
                    position += accuracy
                    dropDownFloatingView.transform = .init(translationX: 0, y: position)
                }
        }
        dropDownFloatingView.floatingViewYPosition = dropDownFloatingView.frame.maxY
    }
    
    private func isScrollDown (scrollView: UIScrollView) -> Bool {
        let currentPosition = scrollView.contentOffset.y
        if lastPosition <= currentPosition {
            lastPosition = currentPosition
            return true
        } else {
            lastPosition = currentPosition
            return false
        }
    }
}

extension TeamListTableViewController: UITableViewDelegate {

    
    
}


extension TeamListTableViewController {
    //
    //        var dummyTableViewController = DropDownTableViewController()
    //
    //        fileprivate func calculateTableViewContentHeight(dropDownFloatingView:  DropDownFloatingView) {
    //            view.addSubview(dummyTableViewController.view)
    //            UIView.animate(withDuration: 0, animations: {
    //            }) { (complete) in
    //                var heightOfTableView: CGFloat = 0.0
    //                // Get visible cells and sum up their heights
    //                let cells = self.dummyTableViewController.tableView.visibleCells
    //                for cell in cells {
    //                    //                print(cell.frame)
    //                    heightOfTableView += cell.frame.height
    //                }
    //                // Edit heightOfTableViewConstraint's constant to update height of table view
    //                print(heightOfTableView)
    //                dropDownFloatingView.tableViewHeight = heightOfTableView
    //
    //            }
    //        }
}
