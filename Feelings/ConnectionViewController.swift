//
//  ConnectionViewController.swift
//  Feelings
//
//  Created by Cake on 8/5/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit
import Alamofire

// Connection View Controller is the View to retrieve all data from my database where date = today's date or a string's date.

class ConnectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
// First, I called the Emoji object model as emoji
    var emoji = [Emoji]()
//  Connection URL
    let URL_RETRIEVE = "http://linziwerle.com/service88.php"
//  A date variable as my connection parameters
    var PassingDate : String = ""
//  Using my DateTimeString model( get a String type date/time )
    var dateString = DateTimeString()
    let currentDate = Date()
    var daysToSubtract = 0
    var daysToAdd = 0
//  Create a dateLabel to present date's string
    @IBOutlet weak var dateLabel: UILabel!
//  Create a TableView outlet. so we can call it later to reload data
    @IBOutlet weak var loadEmojiTableView: UITableView!
//
    @IBOutlet weak var tomorrowDate: UIButton!
    @IBOutlet weak var yesterdayDate: UIButton!
    @IBAction func tomorrowDate(_ sender: Any) {
        emoji.removeAll()
        self.loadEmojiTableView.reloadData()
        daysToSubtract -= -1
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        var dateComponent = DateComponents()
        dateComponent.day = daysToSubtract
        let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        let str = formatter.string(from: pastDate!)
        _ = formatter.string(from: currentDate)
        dateLabel.text = str
        serviceConnection()
    }
    
    @IBAction func yesterdayDate(_ sender: Any) {
        //IMPORTANT!!! HOW TO REFRESH CODE
        emoji.removeAll()
        self.loadEmojiTableView.reloadData()
        daysToSubtract -= 1
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        var dateComponent = DateComponents()
        dateComponent.day = daysToSubtract
        let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        let str = formatter.string(from: pastDate!)
            dateLabel.text = str
        serviceConnection()
        let today = Date()
        _ = formatter.string(from: today)
        if dateLabel.text == PassingDate {
            tomorrowDate.isHidden = true
        }else{
            tomorrowDate.isHidden = false
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emoji.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EmojiTableViewCell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
    
    
        let emojiObject : Emoji
        emojiObject = emoji[indexPath.row]
        cell.symbolNameLabel.text = emojiObject.symbol + ":" + emojiObject.name
        cell.writingLabel.text = emojiObject.writing
        cell.timeStampLabel.text = emojiObject.time
        cell.showsReorderControl = true
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmojiTableView.delegate = self
        self.loadEmojiTableView.dataSource = self
        dateLabel.text = dateString.getCurrentDate(from: Date())
        serviceConnection()
        tomorrowDate.isHidden = true
        if PassingDate == dateLabel.text!  {
             tomorrowDate.isHidden = true
        }
    }
    func serviceConnection(){
        let PassingDate = dateLabel.text
        let parameters : Parameters = ["PassingDate" : PassingDate!]
        Alamofire.request(URL_RETRIEVE, method: .post,parameters : parameters).responseJSON{
            response in
       
            if let json = response.result.value,
                let emojiArray  = json as? NSArray
            
            {
//                let emojiArray : NSArray = json as! NSArray
//                let name = emojiArray.value(forKey: "name") as! NSArray
//                let objCArray = NSMutableArray(array: name)
//                let nameArray = objCArray.compactMap({$0 as? String})
//                let mappedItems = nameArray.map {($0,1)}
//                let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                
                for i in 0..<emojiArray.count{
                    
                    self.emoji.append(Emoji(
                        symbol : ((emojiArray[i] as AnyObject).value(forKey: "symbol") as? String)!,
                        name : ((emojiArray[i] as AnyObject).value(forKey: "name") as? String)!,
                        writing : ((emojiArray[i] as AnyObject).value(forKey: "writing") as? String)!,
                        time : ((emojiArray[i] as AnyObject).value(forKey: "time") as? String)!
                    ))
                }
                print(self.emoji)
                
                self.loadEmojiTableView.reloadData()
            }
        }
    }
}
