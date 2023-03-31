//
//  Singleton.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

class Singleton {
    
    static let shared = Singleton()
    
    var name : String?
    var firstLastName : String?
    var secondLastName : String?
    var eMail : String?
    var cellPhone : String?
    
    func reset() {
        self.name = nil
        self.firstLastName = nil
        self.secondLastName = nil
        self.eMail = nil
        self.cellPhone = nil
    }
}
