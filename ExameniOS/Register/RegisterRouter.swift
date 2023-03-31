//
//  RegisterRouter.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class RegisterRouter {
    var navigation: UINavigationController?
}

extension RegisterRouter: RegisterRouterProtocol {
    func navigateToNextView() {
        if let nav = navigation {
            let userinformation = UserInformationMain.createModule(navigation: nav)
            navigation?.pushViewController(userinformation, animated: true)
        }
    }
}
