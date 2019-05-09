//
//  Storyboard.swift
//  MovieApp
//
//  Created by Omer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import UIKit

public enum Storyboard: String {
    case main = "Main"
    
    public func instantiateViewController<T: UIViewController>(identifier: String = T.className) -> T {
        let bundle = Bundle(for: T.self)
        let storyboard = UIStoryboard(name: self.rawValue, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Cannot instantiate \(T.className)")
        }
        return controller
    }
}
