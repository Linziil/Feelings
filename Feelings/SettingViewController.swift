//
//  SettingViewController.swift
//  Feelings
//
//  Created by Cake on 8/1/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit
//  Use view and constraint to create a split View
//  Create a UIView called mainView on top of current ViewController
//  MainView constraint is initiated with 0 trailing, 0 top, 0 bottom, 0 leading
//  When User press the Menu button(showMenu), mainView will move to the left by 150
class SettingViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
//  Leading is left, trailing is right
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
//  If menu is not showing, mainView remain original position.
        if (menuShowing){
            trailingConstraint.constant = 0
            leadingConstraint.constant = 0
        }else{
//  When menu is showing, leading constraint moves to right 150 point.
//  trailing constraint moves back -150 to prevent mainView content cut out.
        trailingConstraint.constant = -150
        leadingConstraint.constant = 150
        }
//  Set movement animate speed
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
//  Toggle menuShowing (mainView hidding)
        menuShowing = !menuShowing
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//  Set mainView shadow radius and opacity.
//  When mainView move to right by 150, will show mainView outline.
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowRadius = 1
    }
}
