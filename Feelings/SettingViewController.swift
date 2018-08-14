//
//  SettingViewController.swift
//  Feelings
//
//  Created by Cake on 8/1/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowRadius = 1
        // Do any additional setup after loading the view.
    }

    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        if (menuShowing){
            trailingConstraint.constant = 0
            leadingConstraint.constant = 0
        }else{
        trailingConstraint.constant = -150
        leadingConstraint.constant = 150
        
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        menuShowing = !menuShowing
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
