//
//  FrequencyViewController.swift
//  Feelings
//
//  Created by Cake on 8/2/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit
import SQLite3

class FrequencyViewController: UIViewController {
    

    @IBOutlet weak var frequencyLabel: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        frequencyLabel.text = String ("Every \(Int(roundf(sliderOutlet.value))) hours")
//        self.view.backgroundColor = UIColor(red: CGFloat(0), green: CGFloat(Int(sliderOutlet.value)), blue: CGFloat(255), alpha: 1)
 

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderOutlet.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
