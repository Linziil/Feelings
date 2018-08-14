//  EnterMyMoodViewController.swift
//  Feelings
//  Created by Cake on 8/4/18.

import UIKit
import Alamofire

class EnterMyMoodViewController: UIViewController {
    let URL_SAVE_EMOJI = "http://linziwerle.com/insert.php"
    let emojiSet = [ "sad" : "😢", "happy" :  "☺️" , "frustrated" : "😕" , "unhappy" :  "🙁" , "good mood" : "🙂","no feelings" : "😶"  , "funny"  :  "😄", "sneaky" : "😏" ,  "upset" : "😔"]
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewToDismiss: UIView!
    var name : String = ""
    var writing : String = ""
    var symbol : String = ""
    var time : String = ""
    var date : String = ""
    var stats : Int = 0


    
    @IBAction func GoBackToViewButton(_ sender: UIButton) {TextView.isHidden = true
        submitButton.isHidden = true
    }
    @IBOutlet weak var testingDateLabel: UILabel!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet var emojiButtons: [UIButton]!
    @IBOutlet weak var tesingTimeLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func addEmojis(_ sender: UIButton) {
        name = (sender.title(for: .normal)!)
        stats = (sender.tag)
        TextView.isHidden = false
        submitButton.isHidden = false
        TextView.clearsOnInsertion = true
        symbol = emojiSet ["\(name)"]!
        time = tesingTimeLabel.text!
        date = testingDateLabel.text!
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.isHidden = true
        submitButton.isHidden = true
        scrollView.keyboardDismissMode = .onDrag
        
        getCurrentDate()
        getCurrentTime()
    }
    func getCurrentDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        let str = formatter.string(from: Date())
        testingDateLabel.text = str
    }
    func getCurrentTime(){
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let str = formatter.string(from: Date())
        tesingTimeLabel.text = str
    }
    @IBAction func InsertData(_ sender: UIButton) {
        writing = TextView.text
        let parameters: Parameters=[
            "symbol" : symbol,
             "name" : name,
             "writing" : writing,
             "time" : time,
             "date" : date,
             "stats" : stats]
        Alamofire.request(URL_SAVE_EMOJI, method: .post, parameters : parameters).responseJSON{
            response in}
        }
}

