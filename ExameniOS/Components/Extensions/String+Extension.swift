//
//  String+Extension.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

extension String {
    func isEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isPhoneNumber() -> Bool{
        let phoneRegEx = "^\\d{10}$"
        let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: self)
    }

}
