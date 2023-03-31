//
//  UserInformationMain.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class UserInformationMain {
    public static func createModule(navigation : UINavigationController?) -> UIViewController {
        let viewController: UserInformationView? = UserInformationView()
        if let view = viewController {
            let presenter = UserInformationPresenter()
            let router = UserInformationRouter()
            let interactor = UserInformationInteractor()
            
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
