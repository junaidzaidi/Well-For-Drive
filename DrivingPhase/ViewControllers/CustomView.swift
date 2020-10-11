//
//  CustomView.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 06/01/2020.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView{

@IBInspectable var borderWidth: CGFloat = 0.0{

    didSet{

        self.layer.borderWidth = borderWidth
    }
}


@IBInspectable var borderColor: UIColor = UIColor.clear {

    didSet {

        self.layer.borderColor = borderColor.cgColor
    }
}

override func prepareForInterfaceBuilder() {

    super.prepareForInterfaceBuilder()
}

}
