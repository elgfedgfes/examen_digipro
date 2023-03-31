//
//  RegisterView.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class RegisterView: UIViewController {
    var presenter: RegisterPresenterProtocol?
    var ui: RegisterViewUI?
    
    override func loadView() {
        ui = RegisterViewUI(delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension RegisterView: RegisterViewProtocol {
    
}

extension RegisterView: RegisterViewUIDelegate {
    func notifyContinue() {
        presenter?.requestGoToNextView()
    }
    
    func nofifyFailureContinue(message: String) {
        let alert = UIAlertController(title: "¡Ups!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
