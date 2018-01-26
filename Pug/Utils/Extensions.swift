//
//  Extensions.swift
//  Pug
//
//  Created by Philip Starner on 1/25/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
}

extension String {
    public var cleanNumericSubdomain: String {
        get {
            //split string by '.'
            let stringArray = self.split(separator: ".")
            var newString = ""
            for i in 0..<stringArray.count {
                if i == 0 {
                    //replace element 0 with
                    if stringArray[i] != "http://media" {
                        newString += "http://"
                    } else {
                        newString += "http://media"
                    }
                } else if i == stringArray.count - 1 {
                    newString += stringArray[i]
                } else {
                    newString += stringArray[i] + "."
                }
            }
            return newString
        }
    }
}
