//
//  RegisterMain.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class RegisterMain {
    public static func createModule(navigation : UINavigationController?) -> UIViewController {
        let viewController: RegisterView? = RegisterView()
        if let view = viewController {
            let presenter = RegisterPresenter()
            let router = RegisterRouter()
            let interactor = RegisterInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            interactor.presenter = presenter
            
            router.navigation = navigation
            return view
        }
        return UIViewController()
    }
}
