//
//  UIViewController+Rx.swift
//  DataSourceDemo
//
//  Created by 石川大輔 on 2021/10/29.
//

import UIKit

import RxCocoa
import RxSwift

public extension Reactive where Base: UIViewController {
  var viewDidLoad: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidLoad)).map { _ in }
    return ControlEvent(events: source)
  }

  var viewWillAppear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }
    
  var viewDidAppear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }

  var viewWillDisappear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewWillDisappear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }
    
  var viewDidDisappear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewDidDisappear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }

  var viewWillLayoutSubviews: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewWillLayoutSubviews)).map { _ in }
    return ControlEvent(events: source)
  }
  var viewDidLayoutSubviews: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidLayoutSubviews)).map { _ in }
    return ControlEvent(events: source)
  }
}


extension ObservableType {
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}