//
//  CategorySearchViewController.swift
//  Challenge2
//
//  Created by 石川大輔 on 2021/10/26.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class CategorySearchViewController: CategoryViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func makeUI() {
        super.makeUI()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let viewModel = CategorySearchViewModel()
        
        let input = CategorySearchViewModel.Input(
            selection: collectionView.rx.modelSelected(CategoryResouce.self).asDriver())
        let output = viewModel.transform(input: input)
        
        output.categorySelected
            .drive(onNext: { [weak self] viewModel in
                let vc = TeamListTableViewController(viewModel: viewModel)
                vc.navigationItem.title = "【\(viewModel.keyword.value)】"
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
}
