//
//  ExtensionForUIView.swift
//  DarkModeGradientView
//
//  Created by David Perez on 1/4/19.
//  Copyright © 2019 David Perez P. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func gradientBackground(color01: UIColor, color02: UIColor){
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [color01.cgColor, color02.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 1.0,y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradient, at: 0)
    }
    
    func threeColorGradient(color01: UIColor, color02: UIColor, color03: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [color01.cgColor, color02.cgColor, color03.cgColor]
     //   gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0,y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradient, at: 0)
    }
}
