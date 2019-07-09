//
//  UITextFieldUtils.swift
//  SimpsonsQuotes
//
//  Created by gaston on 30/06/2019.
//  Copyright © 2019 gaston. All rights reserved.
//
import UIKit

extension UITextField {
    func setBottomBorder() {
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
        layer.masksToBounds = false
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
}
