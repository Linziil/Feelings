//
//  GradientView.swift
//  Feelings
//
//  Created by Cake on 8/2/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {
    
    
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
    override class var layerClass : AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor.cgColor, SecondColor.cgColor]
    }
    
    
    
}
