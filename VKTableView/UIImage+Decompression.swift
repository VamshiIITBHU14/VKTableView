//
//  UIImage+Decompression.swift
//  VKTableView
//
//  Created by Vamshi Krishna on 21/02/18.
//  Copyright © 2018 Vamshi Krishna. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    var decompressedImage:UIImage{
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: CGPoint.zero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage!
    }
}
