//
//  BorderButton.swift
//  Calculator
//
//  Created by Matt Casanova on 6/15/20.
//  Copyright © 2020 Codejo.io. All rights reserved.
//

import UIKit

@IBDesignable
class BorderButton: UIButton {

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}
