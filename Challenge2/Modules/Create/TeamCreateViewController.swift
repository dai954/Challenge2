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
import RxOptional
import RxGesture

class TeamCreateViewController: ViewController {
    
    let tableView = UITableView()
    var offset: CGPoint?
    
    private var isOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustPositionForKeyboard()

    }

//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    deinit {
        let center = NotificationCenter.default
        center.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func makeUI() {
        super.makeUI()
        
        tableView.backgroundColor = UIColor.primaryGray()
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.contentInset = .init(top: 0, left: 0, bottom: 30, right: 0)
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
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    let categorySelectionTappedRelay = PublishRelay<String>()
    let premiumSwitchTappedRelay = PublishRelay<Bool>()
    let beginnerSwitchTappedRelay = PublishRelay<Bool>()
    let didDoneButtonTappedWithImageRelay = PublishRelay<BackImageResource>()
    let didDoneButtonTappedWithText = BehaviorRelay<[String]>(value: [ChallengeTerm.twentyOne.text])
    let textViewDidBeginEditingRelay = PublishRelay<()>()
    let textViewDidEndEditingRelay = PublishRelay<()>()
    let textFieldDidBeginEditingRelay = PublishRelay<()>()
    let textFieldDidEndEditingRelay = PublishRelay<()>()
    
    private var semiModalPresenter = SemiModalPresenter()
    
    var isKeyboardOpen = BehaviorRelay<Bool>(value: false)
    
    override func bindViewModel() {
        super.bindViewModel()
        
//        let viewTappedEvent = view.rx.tapGesture(configuration: { recognizer, _ in
//            print("viewTappedEvent")
//            recognizer.cancelsTouchesInView = false
//        }).when(.recognized).mapToVoid().asDriver(onErrorJustReturn: ())
        
        // If I use RxGesture, it doesn't working correctly. It end up to get multiple tap event.
        let tapGesture = UITapGestureRecognizer()
        isKeyboardOpen.bind(to: tapGesture.rx.cancelsTouchesInView).disposed(by: disposeBag)
        view.addGestureRecognizer(tapGesture)
        
        let viewModel = TeamCreateViewModel()
        let input = TeamCreateViewModel.Input(viewWillAppearEvent: rx.viewWillAppear.asSignal().mapToVoid(),
                                              itemSelected: tableView.rx.itemSelected.asDriver(),
                                              categoryCellTapped: categorySelectionTappedRelay.asDriver(onErrorJustReturn: ""),
                                              premiumSwitchTapped: premiumSwitchTappedRelay.asDriver(onErrorJustReturn: false),
                                              beginnerSwitchTapped: beginnerSwitchTappedRelay.asDriver(onErrorJustReturn: false), doneButtonTappedWithImageEvent: didDoneButtonTappedWithImageRelay.asDriver(onErrorJustReturn: .backImage1), doneButtonTappedWithTextEvent: didDoneButtonTappedWithText.asDriver(onErrorJustReturn: []), viewTappedEvent:  tapGesture.rx.event.asDriver().mapToVoid()
                                              )
        
        let output = viewModel.transform(input: input)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<AnimatedTeamCreateSection>(
            animationConfiguration: AnimationConfiguration(insertAnimation: .automatic, reloadAnimation: .automatic, deleteAnimation: .automatic),
            configureCell: { [weak self] dataSource, tableView, indexPath, teamCreateSectionItem in
        
                switch teamCreateSectionItem {
                case .teamCreateImage(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateImageCell.teamCreatecellId, for: indexPath) as! TeamCreateImageCell
                    cell.bind(to: viewModel)
                    return cell
                case .teamCreateCategory(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateCategoryCell.cellId, for: indexPath) as! TeamCreateCategoryCell
                    cell.bind(to: viewModel)
                    return cell
                case .teamCreateNmae(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateNameCell.cellId, for: indexPath) as! TeamCreateNameCell
                    cell.bind(to: viewModel)
                    if let strongSelf = self {
                        cell.rx.textFieldDidBeginEditing.asObservable().bind(to: strongSelf.textFieldDidBeginEditingRelay).disposed(by: cell.disposeBag)
                        cell.rx.textFieldDidEndEditing.asObservable().bind(to: strongSelf.textFieldDidEndEditingRelay).disposed(by: cell.disposeBag)
                    }
                    return cell
                case .teamCreateHeaderImage(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateHeaderImageCell.cellId, for: indexPath) as! TeamCreateHeaderImageCell
                    cell.bind(to: viewModel)
                    return cell
                case .teamCreatePremium(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreatePremiumCell.cellId, for: indexPath) as! TeamCreatePremiumCell
                    if let strongSelf = self {
                        cell.rx.switchDidTapped.asObservable().bind(to: strongSelf.premiumSwitchTappedRelay).disposed(by: cell.disposeBag)
                    }
                    
                    cell.bind(to: viewModel)
                    return cell
                case .teamCreateBeginner(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateBeginnerCell.cellId, for: indexPath) as! TeamCreateBeginnerCell
                    if let strongSelf = self {
                        cell.rx.switchDidTapped.asObservable().bind(to: strongSelf.beginnerSwitchTappedRelay).disposed(by: cell.disposeBag)
                    }
                    cell.bind(to: viewModel)
                    return cell
                case .teamCreateChallenge(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateChallengeTermCell.cellId, for: indexPath) as! TeamCreateChallengeTermCell
                    cell.bind(to: viewModel)
                    return cell
                case .teamCreateDescription(let viewModel):
                    let cell = tableView.dequeueReusableCell(withIdentifier: TeamCreateDescriptionCell.cellId, for: indexPath) as! TeamCreateDescriptionCell
                    if let strongSelf = self {
                        cell.rx.textViewDidBeginEditing.asObservable().bind(to: strongSelf.textViewDidBeginEditingRelay).disposed(by: cell.disposeBag)
                        cell.rx.textViewDidEndEditing.asObservable().bind(to: strongSelf.textViewDidEndEditingRelay).disposed(by: cell.disposeBag)
                    }
                    cell.delegate = self
                    cell.bind(to: viewModel)
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
        
        let categorySelectionVC = CategorySelectionViewController()
        categorySelectionVC.categoryCellTappedObservable.bind(to: categorySelectionTappedRelay).disposed(by: disposeBag)
        
        output.categorySelectTrigger.drive(onNext: { [weak self] _ in
            let baseVC = SelectionScrollViewController(categorySearchVC: categorySelectionVC, officialAppSearchVC: OfficialAppViewController())
            baseVC.modalPresentationStyle = .fullScreen
            self?.present(baseVC, animated: true)
        }).disposed(by: disposeBag)
        
        output.pickerTriggerWithString.drive(onNext: { [weak self] indexPath, stringArray in
            if let strongSelf = self {
                let vc = SemiModalPickerViewController()
                vc.cellTappedIndexRelay.accept(indexPath)
                vc.cellTappedStringRelay.accept(stringArray)
                vc.rx.doneTappedWithText.bind(to: strongSelf.didDoneButtonTappedWithText).disposed(by: vc.disposeBag)
                strongSelf.semiModalPresenter.viewController = vc
                strongSelf.present(vc, animated: true)
            }
        }).disposed(by: disposeBag)
        
        output.selectImageTrigger.drive(onNext: { [weak self] indexPath in
            if let strongSelf = self {
                let vc = SemiModalImageCollectionViewController()
                vc.rx.doneTappedWithImage.bind(to: strongSelf.didDoneButtonTappedWithImageRelay).disposed(by: vc.disposeBag)
                strongSelf.semiModalPresenter.viewController = vc
                strongSelf.present(vc, animated: true)
            }
        }).disposed(by: disposeBag)
    }
    
}


//MARK: - Text view height expansion delegate
extension TeamCreateViewController: descriptionTextViewDelegate {
    func descriptionTextViewDidChanged() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

//MARK: - Adjust position for keyboard
extension TeamCreateViewController {
    
    func adjustPositionForKeyboard() {
        // Kyeboard open notification
        let keyboardOpenObservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
             .map { notification -> (CGFloat, Double) in
                self.isKeyboardOpen.accept(true)
                 let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
                 let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
                 return (height, duration)
             }.share(replay: 1)
    
        // Kyeboard close notification
        let keyboardCloseObservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
            .map { notification -> Double in
                self.isKeyboardOpen.accept(false)
                let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
                return duration
            }.share(replay: 1)
        
        // Keyboard open trigger with begin editing relay for textView
        let textViewDidBeginEditingObservable = textViewDidBeginEditingRelay.asObservable()
        let _ = textViewDidBeginEditingObservable.withLatestFrom(keyboardOpenObservable)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] keyboardHeight, keyboardDuration in
                self?.offset = self?.tableView.contentOffset
                UIView.animate(withDuration: keyboardDuration, delay: 0.0, options: .curveLinear, animations: {
                    self?.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
                    self?.tableView.contentOffset.y = keyboardHeight - 50
                }, completion: nil)
            }).disposed(by: disposeBag)
        
        
        //        Keyboard close trigger for textView
        let textViewDidEndEditingObservable = textViewDidEndEditingRelay.asObservable()
        let _ = textViewDidEndEditingObservable.withLatestFrom(keyboardCloseObservable)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { keyboardDuration in
                UIView.animate(withDuration: keyboardDuration, animations: {
                    if let unwrappedOffset = self.offset {
                        self.tableView.contentOffset = unwrappedOffset
                    }
                    self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
                })
            }).disposed(by: disposeBag)
        
        // Keyboard open trigger with begin editing relay for textField
        let textFieldDidBeginEditingObservable = textFieldDidBeginEditingRelay.asObservable()
        let _ = textFieldDidBeginEditingObservable.withLatestFrom(keyboardOpenObservable)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] keyboardHeight, keyboardDuration in
                print("textFieldDidBeginEditingObservable called withLatestFrom")
                self?.offset = self?.tableView.contentOffset
                UIView.animate(withDuration: keyboardDuration, delay: 0.0, options: .curveLinear, animations: {
                    self?.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
                }, completion: nil)
            }).disposed(by: disposeBag)
            // * only first time, use combine latest
        let _ = Observable.combineLatest(textFieldDidBeginEditingObservable, keyboardOpenObservable)
            .take(1)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _, keyboardHeightAndDuration in
                print("textFieldDidBeginEditingObservable called combineLatest")
                self?.offset = self?.tableView.contentOffset
                UIView.animate(withDuration: keyboardHeightAndDuration.1, delay: 0.0, options: .curveLinear, animations: {
                    self?.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeightAndDuration.0, right: 0)
                }, completion: nil)
            }).disposed(by: disposeBag)
        
        
        //        Keyboard close trigger for textField
        let textFieldDidEndEditingObservable = textFieldDidEndEditingRelay.asObservable()
        let _ = textFieldDidEndEditingObservable.withLatestFrom(keyboardCloseObservable)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { keyboardDuration in
                print("textFieldDidEndEditingObservable called")
                UIView.animate(withDuration: keyboardDuration, animations: {
                    self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
                })
            }).disposed(by: disposeBag)
        
    }
    
}
