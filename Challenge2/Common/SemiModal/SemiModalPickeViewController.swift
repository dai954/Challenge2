//
//  SemiModalPickeViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/12/01.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import RxOptional

class SemiModalPickerViewController: CustomSemiModalViewController {
    
    deinit {
        print("deinit")
    }
    
    let pickerView = UIPickerView()
    
    let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .orange
        return stackView
    }()
    
    let pickerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "試しにはじめたい人にオススメです。\n7日間継続できれば、50%の人が\nその後も習慣化に成功すると言われています。"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vStackView.anchor(top: semiModalTitleBarView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 30, right: 0))
    }
    
    override func makeUI() {
        super.makeUI()
        pickerView.backgroundColor = .cyan
        vStackView.insertArrangedSubview(pickerView, at: 0)
        vStackView.insertArrangedSubview(pickerDescriptionLabel, at: 1)
        contentView.addSubview(vStackView)
    }
    
    var viewModel = SemiModalPickerViewModel()
    
    let cellTappedIndexRelay = BehaviorRelay<IndexPath?>(value: nil)
    let cellTappedStringRelay = BehaviorRelay<[String]?>(value: nil)
    override func bindViewModel() {
        super.bindViewModel()
        
//      let  viewModel = SemiModalPickerViewModel()
        let input = SemiModalPickerViewModel.Input(cellTappedIndexPath: cellTappedIndexRelay.asDriver(onErrorJustReturn: nil).filterNil(),
                                                   itemSelected: pickerView.rx.itemSelected.asDriver(),
                                                   cellTappedString: cellTappedStringRelay.asDriver().filterNil()
        )
        let output = viewModel.transform(input: input)
        
        //" let sampleData = Driver.just([["A", "B", "C"]]) sampleData.drive " is error. is this a bug ??
        var dataForPicker: [[String]] = []
        output.pickerData.drive(onNext: { data in
            dataForPicker = data
        }).disposed(by: disposeBag)
        Driver.just(dataForPicker)
            .drive(pickerView.rx.items(adapter: PickerViewAdapter()))
            .disposed(by: disposeBag)
        
        output.pickerSelectedState.drive(onNext: {[weak self] pair in
            self?.pickerView.selectRow(pair.row, inComponent: pair.component, animated: false)
        }).disposed(by: disposeBag)
        
        output.pickerLabelChangeTrigger.drive(pickerDescriptionLabel.rx.text).disposed(by: disposeBag)
        
    }
    
}
