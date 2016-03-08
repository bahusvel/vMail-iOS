//
//  CircleButton.swift
//  vMail
//
//  Created by denis lavrov on 8/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {

    override func drawRect(rect: CGRect) {
        CircleBarStyleKit.drawButton(frame: rect)
    }

}
