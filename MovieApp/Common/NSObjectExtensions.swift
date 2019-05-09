//
//  NSObjectExtensions.swift
//  MovieApp
//
//  Created by Omer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
public extension NSObject {
    // MARK: - Static Properties
    @objc class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
