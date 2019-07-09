//
//  UIViewExtension.swift
//  SimpsonsQuotes
//
//  Created by gaston on 06/07/2019.
//  Copyright © 2019 gaston. All rights reserved.
//

import UIKit

extension UIViewController {
    func getNavigationBarHeight() -> CGFloat {
        if let navigationHeight = self.navigationController?.navigationBar.frame.height {
            return navigationHeight + UIApplication.shared.statusBarFrame.height
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
}
