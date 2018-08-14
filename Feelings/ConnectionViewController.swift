//
//  ConnectionViewController.swift
//  Feelings
//
//  Created by Cake on 8/5/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit
import Alamofire

class ConnectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let currentDate = Date()
    var daysToSubtract : Int = 0
    var daysToAdd : Int = 0
   
    let URL_RETRIEVE = "http://linziwerle.com/service88.php"
    let PassingDate : String = ""
   
    
    @IBOutlet weak var tomorrowDate: UIButton!
    @IBOutlet weak var yesterdayDate: UIButton!
    @IBAction func tomorrowDate(_ sender: Any) {
        emo.removeAll()
        self.stockResultsFeed.reloadData()
        daysToSubtract -= -1
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        var dateComponent = DateComponents()
        dateComponent.day = daysToSubtract
        let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        let str = formatter.string(from: pastDate!)
        let strT = formatter.string(from: currentDate)
        dateLabel.text = str
        let PassingDate = dateLabel.text!
        alaDataPassing()
    
    }
    
    @IBAction func yesterdayDate(_ sender: Any) {
        //IMPORTANT!!! HOW TO REFRESH CODE
        emo.removeAll()
        self.stockResultsFeed.reloadData()
        //
        daysToSubtract -= 1
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        var dateComponent = DateComponents()
        dateComponent.day = daysToSubtract
        let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        let str = formatter.string(from: pastDate!)
            dateLabel.text = str
        let PassingDate = dateLabel.text!
        alaDataPassing()
        
        let today = Date()
        let strT = formatter.string(from: today)
      
        if dateLabel.text == "08/10/18" {
            tomorrowDate.isHidden = true
        }else{
            tomorrowDate.isHidden = false
        }
       
    
    }
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var stockResultsFeed: UITableView!
    

    
    var emo = [Emoji]()
   // emo is an NSArray from Emoji Object
    
    
    func getCurrentDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        let strDate = formatter.string(from: Date())
        dateLabel.text = strDate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EmojiTableViewCell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! EmojiTableViewCell
    
    
        let ji : Emoji
        ji = emo[indexPath.row]
        cell.symbolNameLabel.text = ji.symbol + ":" + ji.name
        cell.writingLabel.text = ji.writing
        cell.timeStampLabel.text = ji.time
        cell.showsReorderControl = true
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stockResultsFeed.delegate = self
        self.stockResultsFeed.dataSource = self
        getCurrentDate()
        alaDataPassing()
        tomorrowDate.isHidden = true
        if PassingDate == dateLabel.text!  {
             tomorrowDate.isHidden = true
        }
        
    }
    
    func alaDataPassing(){
        let PassingDate = dateLabel.text
        let parameters : Parameters = ["PassingDate" : PassingDate!]
        Alamofire.request(URL_RETRIEVE, method: .post,parameters : parameters).responseJSON{
            response in
            //            print("Log \(response)")
            //            print("Log response.request: \(response.request)")
            //            print("Log response.error: \(response.error)")
            //            print("Log response.data: \(response.data)")
            //            print("Log response.result: \(response.result)")
            
            if let json = response.result.value{
                let emojiArray : NSArray = json as! NSArray
                for i in 0..<emojiArray.count{
                    
                    self.emo.append(Emoji(
                        symbol : ((emojiArray[i] as AnyObject).value(forKey: "symbol") as? String)!,
                        name : ((emojiArray[i] as AnyObject).value(forKey: "name") as? String)!,
                        writing : ((emojiArray[i] as AnyObject).value(forKey: "writing") as? String)!,
                        time : ((emojiArray[i] as AnyObject).value(forKey: "time") as? String)!
                    ))
                }
                self.stockResultsFeed.reloadData()
            }
        }
    }
    
}
