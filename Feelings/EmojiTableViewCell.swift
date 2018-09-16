//
//  EmojiTableViewCell.swift
//  Feelings
//
//  Created by Cake on 8/7/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit
//  Create a sub table view cell from ConnectionViewController
//  This table view cell is created for mapping and populating the dynamic data from Feelings database
class EmojiTableViewCell: UITableViewCell {
//  Create 3 labels to present symbol and name, use's input thought, and time stamp
    @IBOutlet weak var symbolNameLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!

//  Configure the view for the selected state
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//  Can change backgroundColor when selected a cell
    }
}
