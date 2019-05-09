//
//  UIViewControllerExtensions.swift
//  MovieAppTests
//
//  Created by Omer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func becomeActive() {
        UIView.setAnimationsEnabled(false)
        UIApplication.shared.keyWindow?.rootViewController = self
        UIView.setAnimationsEnabled(true)
    }
}
