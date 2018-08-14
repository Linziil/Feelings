//
//  EmojiTableViewCell.swift
//  Feelings
//
//  Created by Cake on 8/7/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolNameLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
//    func update(with ann: Emoji){
//        symbolNameLabel.text = ann.symbol + ":" + ann.name
//        writingLabel.text = ann.writing
//        timeStampLabel.text = ann.time
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
