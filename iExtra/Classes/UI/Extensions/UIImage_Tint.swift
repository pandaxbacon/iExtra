//
//  UIImage_Tint.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-09.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit
import CoreGraphics

public extension UIImage {
    
    public func tinted(withColor color: UIColor, blendMode: CGBlendMode) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        draw(in: rect, blendMode: blendMode, alpha: 1.0)
        context?.setBlendMode(blendMode)
        color.setFill()
        context?.fill(rect)
        draw(in: rect, blendMode: .destinationIn, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}
