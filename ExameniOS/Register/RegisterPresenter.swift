//
//  RegisterPresenter.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class RegisterPresenter {
    weak var view: RegisterViewProtocol?
    var interactor: RegisterInteractorProtocol?
    var router: RegisterRouterProtocol?
}

extension RegisterPresenter : RegisterPresenterProtocol {
    func requestGoToNextView() {
        router?.navigateToNextView()
    }
}
