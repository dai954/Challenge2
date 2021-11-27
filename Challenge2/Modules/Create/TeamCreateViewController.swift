//
//  TeamCreateViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TeamCreateViewController: ViewController {
    
    let tableView = UITableView()
    var offset: CGPoint?
    
    private var isOpen = false
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        offset = tableView.contentOffset
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            print("tableView.contentOffset.y in willShowA", tableView.contentOffset.y)
            print("keyboardHeight", keyboardHeight)
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
//            tableView.contentOffset.y = keyboardHeight / 2
            tableView.contentOffset.y = 200
            print("tableView.contentOffset.y in willSHowB", tableView.contentOffset.y)
        }
    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            if let unwrappedOffset = self.offset {
                self.tableView.contentOffset = unwrappedOffset
            }
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        })
    }

    deinit {
        let center = NotificationCenter.default
        center.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = "チーム作成"
    }
    
    override func makeUI() {
        super.makeUI()
        
        tableView.backgroundColor = UIColor.primaryGray()
//        tableView.allowsSelection = false
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(TeamCreateImageCell.self, forCellReuseIdentifier: TeamCreateImageCell.teamCreatecellId)
        tableView.register(TeamCreateHeaderImageCell.self, forCellReuseIdentifier: TeamCreateHeaderImageCell.cellId)
        tableView.register(TeamCreateCategoryCell.self, forCellReuseIdentifier: TeamCreateCategoryCell.cellId)
        tableView.register(TeamCreateNameCell.self, forCellReuseIdentifier: TeamCreateNameCell.cellId)
        tableView.register(TeamCreatePremiumCell.self, forCellReuseIdentifier: TeamCreatePremiumCell.cellId)
        tableView.register(TeamCreateBeginnerCell.self, forCellReuseIdentifier: TeamCreateBeginnerCell.cellId)
        tableView.register(TeamCreateChallengeTermCell.self, forCellReuseIdentifier: TeamCreateChallengeTermCell.cellId)
        tableView.register(TeamCreateDescriptionCell.self, forCellReuseIdentifier: TeamCreateDescriptionCell.cellId)
        tableView.register(TeamCreateOptionTopCell.self, forCellReuseIdentifier: TeamCreateOptionTopCell.teamCreateOptionTopCellId)
        tableView.register(TeamCreateOptionCell.self, forCellReuseIdentifier: TeamCreateOptionCell.cellId)
        tableView.register(TeamCreateOptionBottomCell.self, forCellReuseIdentifier: TeamCreateOptionBottomCell.teamCreateOptionBottomCellId)
        tableView.register(TeamCreateButtonCell.self, forCellReuseIdentifier: TeamCreateButtonCell.cellId)
        
        view.addSubview(tableView)
        view.addSubview(navBar)
        
        navBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 0, height: ViewController.navBarHeight))
        tableView.anchor(top: navBar.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let viewModel = TeamCreateViewModel()
        let input = TeamCreateViewModel.Input(viewWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid(),
                                              itemSelected: tableView.rx.itemSelected.asDriver()
        )
        let output = viewModel.transform(input: input)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<AnimatedTeamCreateSection>(
            animationConfiguration: AnimationConfiguration(insertAnimation: .automatic, reloadAnimation: .automatic, deleteAnimation: .automatic),
            configureCell: { dataSource, tableView, indexPath, teamCreateSectionItem in
                
                switch teamCreateSectionItem {
                case .teamCreateImage:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateImageCell.teamCreatecellId, for: indexPath)
                    return cell
                case .teamCreateCategory:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateCategoryCell.cellId, for: indexPath)
                    return cell
                case .teamCreateNmae:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateNameCell.cellId, for: indexPath)
                    return cell
                case .teamCreateHeaderImage:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateHeaderImageCell.cellId, for: indexPath) as! TeamCreateHeaderImageCell
                    cell.pickerKeyboardView.delegate = self
                    return cell
                case .teamCreatePremium:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreatePremiumCell.cellId, for: indexPath)
                    return cell
                case .teamCreateBeginner:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateBeginnerCell.cellId, for: indexPath)
                    return cell
                case .teamCreateChallenge:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateChallengeTermCell.cellId, for: indexPath)
                    return cell
                case .teamCreateDescription:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateDescriptionCell.cellId, for: indexPath) as! TeamCreateDescriptionCell
                    cell.delegate = self
                    cell.controller = self
                    return cell
                case .teamCreateOptionTop:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateOptionTopCell.teamCreateOptionTopCellId, for: indexPath) as! TeamCreateOptionTopCell
                    return cell
                case .teamCreateMemberOption:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateOptionCell.cellId, for: indexPath)
                    return cell
                case .teamCreateAgeOption:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateOptionCell.cellId, for: indexPath)
                    return cell
                case .teamCreateGenderOption:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateOptionCell.cellId, for: indexPath)
                    return cell
                case .teamCreateExitTermOption:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateOptionCell.cellId, for: indexPath)
                    return cell
                case .teamCreateAssistantOption:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateOptionBottomCell.teamCreateOptionBottomCellId, for: indexPath)
                    return cell
                case .teamCreateButton:
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateButtonCell.cellId, for: indexPath)
                    return cell
                }
            })
        
        output.teamCreateSections.drive(tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        output.categorySelectTrigger.drive(onNext: { [weak self] _ in
            let baseVC = SelectionScrollViewController(categorySearchVC: CategorySelectionViewController(), officialAppSearchVC: OfficialAppViewController())
            baseVC.modalPresentationStyle = .fullScreen
            self?.present(baseVC, animated: true)
        }).disposed(by: disposeBag)
        
        output.pickerTrigger.drive(onNext: { [weak self] indexPath in
            let cell = self?.tableView.cellForRow(at: indexPath) as! PickableCellType
            cell.pickerKeyboardView.becomeFirstResponder()
        }).disposed(by: disposeBag)
    }
}

protocol PickableCellType {
    var pickerKeyboardView: GeneralPickerKiyboardView { get }
}

extension TeamCreateViewController: descriptionTextViewDelegate {
    func descriptionTextViewDidChanged() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension TeamCreateViewController: AddChildDlegate {
    func willAddChild(viewController: UIViewController, stackView: UIStackView) {
        addChild(viewController)
        stackView.addArrangedSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}
