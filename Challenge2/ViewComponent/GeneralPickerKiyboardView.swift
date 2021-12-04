//
//  GeneralPickerKiyboardView.swift
//  ActionSheetPickerViewDemo
//
//  Created by 石川大輔 on 2021/11/25.
//

//import UIKit
//import RxSwift
//import RxCocoa
//
//enum PickerKeyboardType {
//    case normal
//    case selectBackImage
//}
//
//protocol AddChildDlegate: AnyObject {
//    func willAddChild(viewController: UIViewController, stackView: UIStackView)
//}
//
//protocol PickerDataType {
//    var text: String {get}
//    var description: String{get}
//}
//
//class GeneralPickerKiyboardView: UIControl, BackImageDelegate {
//
//    let disposeBag = DisposeBag()
//    var backImage: UIImage?
//    weak var delegate: AddChildDlegate?
//    var pickerKeyboardType: PickerKeyboardType = .normal
//    var pickerData: [[PickerDataType]] = [[]]
//    var titleLabelText = "年齢制限設定"
//    var pickerDescription = "15日間行動のないメンバーは\nシステムにより自動的に退出させられます。"
//
//
//    fileprivate var textStore: String = ""
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .white
//        addTarget(self, action: #selector(GeneralPickerKiyboardView.didTap(sender:)), for: .touchUpInside)
//
//    }
//
//    convenience init(pickerKeyboardType: PickerKeyboardType, data: [[PickerDataType]] = [ChallengeTerm.allCases]) {
//        self.init(frame: .zero)
//        print("degug init picker keyboard")
//        self.pickerKeyboardType = pickerKeyboardType
//        self.pickerData = data
//    }
//
//    deinit {
//        print("degug deinit picker keyboard")
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    @objc func didTap(sender: GeneralPickerKiyboardView) {
//        becomeFirstResponder()
//    }
//
//    @objc func didTapDone(sender: UIButton) {
//        NotificationCenter.default.post(name: Notification.Name("didTapDoneNotification"), object: nil, userInfo: ["isPickerOpen": false])
//
//        let name = Notification.Name("backImageNotification")
//        NotificationCenter.default.post(name: name, object: nil, userInfo: ["pickedBackImage": backImage ?? BackImageResource.backImage1.backImage])
//
//        resignFirstResponder()
//    }
//
//    func didTapBackImage(image: UIImage) {
//        backImage = image
//    }
//
//    override var canBecomeFirstResponder: Bool {
//        return true
//    }
//
//
//    let pickerLabel: UILabel = {
//        let label = UILabel()
//        label.text = "hey hello"
//        return label
//    }()
//
//    override var inputView: UIView? {
//
//        let titleLabel = UILabel()
//        titleLabel.text = titleLabelText
//        titleLabel.sizeToFit()
//
//        let button = UIButton(type: .system)
//        button.setTitle("決定", for: .normal)
//        button.addTarget(self, action: #selector(GeneralPickerKiyboardView.didTapDone(sender:)), for: .touchUpInside)
//        button.sizeToFit()
//        button.tintColor = .red
//
//        let topView = UIView()
//        topView.backgroundColor = .white
//
//        let overallview = UIView()
//
//        switch pickerKeyboardType {
//        case .normal:
//            let pickerView = UIPickerView()
//            pickerView.delegate = self
//            let row = pickerData[0].map { $0.text }.firstIndex(of: textStore) ?? -1
//            pickerView.selectRow(row, inComponent: 0, animated: false)
//
//            let attributedString = pickerDescription.lineSpaceAttributedString(space: 5)
//
//            let pickerLabel = UILabel()
//            pickerLabel.text = "hello"
//
//
//            pickerLabel.attributedText = attributedString
//            pickerLabel.textAlignment = .center
//            pickerLabel.font = .systemFont(ofSize: 12)
//            pickerLabel.numberOfLines = 0
//            pickerLabel.sizeToFit()
//
//            topView.addSubview(titleLabel)
//            topView.addSubview(button)
//            titleLabel.centerInSuperview()
//            button.anchor(top: topView.topAnchor, leading: nil, bottom: topView.bottomAnchor, trailing: topView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
//
//            let vStackView = UIStackView(arrangedSubviews: [topView, pickerView, pickerLabel, UIView()])
//            vStackView.axis = .vertical
//            vStackView.spacing = 20
//            overallview.addSubview(vStackView)
//            topView.constrainHeight(constant: 44)
//            pickerView.constrainHeight(constant: 100)
//            vStackView.fillSuperview()
//            overallview.fillSuperview()
//        case .selectBackImage:
//            print("debug selectBackImage")
//            let backImageCollectionViewController = BackGroundImageCollectionViewController()
//            backImageCollectionViewController.delegate = self
//
//            topView.addSubview(titleLabel)
//            topView.addSubview(button)
//            titleLabel.centerInSuperview()
//            button.anchor(top: topView.topAnchor, leading: nil, bottom: topView.bottomAnchor, trailing: topView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
//
//            let vStackView = UIStackView(arrangedSubviews: [topView])
//            vStackView.axis = .vertical
//
//            delegate?.willAddChild(viewController: backImageCollectionViewController, stackView: vStackView)
//
//            overallview.addSubview(vStackView)
//            topView.constrainHeight(constant: 44)
//            vStackView.fillSuperview()
//            overallview.fillSuperview()
//        }
//
//        return overallview
//    }
//
//}
//
//extension GeneralPickerKiyboardView: UIPickerViewDelegate, UIPickerViewDataSource {
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerData[component].count
//    }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return pickerData.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerData[component][row].text
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        textStore = pickerData[component][row].text
//
//        print("textSrore",textStore)
//        setNeedsDisplay()
//    }
//}


//extension TeamCreateViewController: AddChildDlegate {
//    func willAddChild(viewController: UIViewController, stackView: UIStackView) {
//
//        addChild(viewController)
//        stackView.addArrangedSubview(viewController.view)
//        viewController.didMove(toParent: self)
//    }
//}

//protocol PickableCellType {
//    var pickerKeyboardView: GeneralPickerKiyboardView { get }
//}

