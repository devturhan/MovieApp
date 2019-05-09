//
//  UIImageViewExtensions.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func loadFrom(_ stringUrl: String ){
        self.sd_setImage(with: URL(string: stringUrl), completed: nil)
    }
}
