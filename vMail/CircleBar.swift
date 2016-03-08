//
//  CircleBar.swift
//  vMail
//
//  Created by denis lavrov on 8/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

@IBDesignable
class CircleBar: UIView {
    
    override func drawRect(rect: CGRect) {
        CircleBarStyleKit.drawBar(frame: rect)
    }


}
