//
//  CategorySelectionViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/11/27.
//

import UIKit
import RxSwift
import RxCocoa

class CategorySelectionViewController: CategoryViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func makeUI() {
        super.makeUI()
    }

    override func bindViewModel() {
        super.bindViewModel()
        let viewModel = CategorySelectionViewModel()
        let input = CategorySelectionViewModel.Input(selection: collectionView.rx.modelSelected(CategoryResouce.self).asDriver())

        let output = viewModel.transform(input: input)

        output.categorySelectedTitle.drive(onNext: { [weak self] title in
            print(title)
            self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }

}
