//
//  GradientView.swift
//  Feelings
//
//  Created by Cake on 8/2/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit
@IBDesignable

//  reusable sub UIView.
//  can change background color with gradient colors.
//  can access in Interface Builder
//  can create many gradient colors properties
class GradientView: UIView {
//  initiate first color to be clear, late can change on Interface Builder.
//  didSet property observer will watch any changes and update the property value
    @IBInspectable var firstColor: UIColor = UIColor.clear{
        didSet {
            updateView()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.clear{
        didSet {
            updateView()
        }
    }
// override layerClass change layer default to Gradient background
    override class var layerClass : AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
// call layer and layer colors are defined by firstColor and SecondColor
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor.cgColor, SecondColor.cgColor]
    }
    
    
    
}
