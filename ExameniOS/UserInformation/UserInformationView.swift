//
//  UserInformationView.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class UserInformationView: UIViewController {
    var presenter: UserInformationPresenterProtocol?
    var ui: UserInformationViewUI?
    
    override func loadView() {
        ui = UserInformationViewUI(delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension UserInformationView: UserInformationViewProtocol {
    
}

extension UserInformationView: UserInformationViewUIDelegate {
    func notifyNavigateBack() {
        Singleton.shared.reset()
        self.navigationController?.popViewController(animated: true)
    }
}
