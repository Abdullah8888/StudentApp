//
//  UIImageView+Extension.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    func showImage(url: String, placeholderImage: UIImage? = nil) {
        sd_setImage(with: URL(string: url), placeholderImage: placeholderImage)
    }
    
}
