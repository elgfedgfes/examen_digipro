//
//  RegisterProtocols.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit


protocol RegisterViewProtocol: AnyObject {
    
}

protocol RegisterInteractorProtocol: AnyObject {
    
}

protocol RegisterPresenterProtocol: AnyObject {
    func requestGoToNextView()
}

protocol RegisterRouterProtocol: AnyObject {
    func navigateToNextView()
}
