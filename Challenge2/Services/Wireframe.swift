//
//  Wireframe.swift
//  RxSwiftGitHubSignup
//
//  Created by 石川大輔 on 2021/10/06.
//

import RxSwift

protocol Wireframe {
    func promptFor<Action: CustomStringConvertible>(title: String?, message: String?, titleColor: UIColor?, messageColor: UIColor?, titleFont: UIFont?, messageFont: UIFont?, actionTextColor: UIColor, cancelAction: Action, actions: [Action], preferrdeStyle: UIAlertController.Style, cancelActionStyle: UIAlertAction.Style) -> Observable<Action>
}

class DefaultWireframe: Wireframe {
    
    static let shared = DefaultWireframe()
    
    static func rootViewController() -> UIViewController {
        print((UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController)!)
        return (UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController)!
    }
    
    func promptFor<Action>(title: String?, message: String?, titleColor: UIColor?, messageColor: UIColor?, titleFont: UIFont?, messageFont: UIFont? ,actionTextColor: UIColor, cancelAction: Action, actions: [Action], preferrdeStyle: UIAlertController.Style, cancelActionStyle: UIAlertAction.Style = .cancel) -> Observable<Action> where Action : CustomStringConvertible {
        
        return Observable.create { observer in
            
            let alertView = UIAlertController(title: title, message: message, preferredStyle: preferrdeStyle)
            alertView.view.tintColor = actionTextColor
            
            if message != nil {
                alertView.setMessage(font: messageFont, color: messageColor)
            }

            alertView.addAction(UIAlertAction(title: cancelAction.description, style: cancelActionStyle, handler: { _ in
                print("actionSheet cancel action")
                observer.on(.next(cancelAction))
            }))
            
            for action in actions {
                alertView.addAction(UIAlertAction(title: action.description, style: .default, handler: { _ in
                    print("actionSheet default action")
                    observer.on(.next(action))
                }))
            }
            
            DispatchQueue.main.async {
                DefaultWireframe.rootViewController().present(alertView, animated: true, completion: nil)
            }
            
            return Disposables.create {
                print("actionSheet disposed")
                alertView.dismiss(animated: false, completion: nil)
            }
        }
        
    }
    
    
}

