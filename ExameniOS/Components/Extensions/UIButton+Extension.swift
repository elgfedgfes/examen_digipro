//
//  UIButton+Extension.swift
//  ExameniOS
//
//  Created by Luis Fernando Sánchez Palma on 30/03/23.
//

import UIKit

extension UIButton {
    public func setEnableButton(enable: Bool){
        if enable {
            self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.setTitleColor(.white, for: .normal)
        } else {
            self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1095819537)
            self.setTitleColor(UIColor(red: 0.09803921569, green: 0.1607843137, blue: 0.2549019608, alpha: 0.301660803), for: .normal)
        }
        self.isUserInteractionEnabled = enable
    }
}
