//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Administrador on 16/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}
