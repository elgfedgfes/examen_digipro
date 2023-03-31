//
//  UserInformationPresenter.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class UserInformationPresenter {
    weak var view: UserInformationViewProtocol?
    var interactor: UserInformationInteractorProtocol?
    var router: UserInformationRouterProtocol?
}

extension UserInformationPresenter: UserInformationPresenterProtocol {
    
}
