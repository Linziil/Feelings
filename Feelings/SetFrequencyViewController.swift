//
//  SetFrequencyViewController.swift
//  Feelings
//
//  Created by Cake on 8/2/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit

//  ViewController under Settings that can modify the frequency of notification
//  Set how often user wants the app ask to record feelings.
//  Set frequency from never ask to Every 1 hour
class SetFrequencyViewController: UIViewController {
    
//  A label to show how often user wants to be notified
    @IBOutlet weak var frequencyLabel: UILabel!
//  Create a slider from min value 0 to max value 12
    @IBOutlet weak var slider: UISlider!
//  When interact slider up, down, slider's value will be updated on frequencyLabel.
    @IBAction func sliderAction(_ sender: UISlider) {
//  Convert slider value from Double to Int, present as a String
        frequencyLabel.text = String ("Every \(Int(roundf(slider.value))) hours")
//  Use slider value to change background color.
//       self.view.backgroundColor = UIColor(red: CGFloat(0), green: CGFloat(Int(sliderOutlet.value)), blue: CGFloat(255), alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//  Use slider.transform property to change slider orientation from horizontal to vertical.
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
    }
}
