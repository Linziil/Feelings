//  EnterMyMoodViewController.swift
//  Insert Emoji to WebServer Database
//  Feelings
//  Created by Cake on 8/4/18.

import UIKit
import Alamofire

class EnterMyMoodViewController: UIViewController {
//  retrieve CovertDateAndTimeToString model.
//  to get a string type of currentTime and currentDate
    var dateAndTime = DateTimeString()
//  A label to show date
    @IBOutlet weak var dateLabel: UILabel!
//  A label to show insert Emoji time
    @IBOutlet weak var timeLabel: UILabel!
//  A collection of emoji buttons
    @IBOutlet var emojiButtons: [UIButton]!
//  A button to send post request, insert value into Feelings web database
    @IBOutlet weak var submitButton: UIButton!
//  A textView for input user's thought
    @IBOutlet weak var textView: UITextView!
//  Create a scrollView to ondrag disable keyboard
    @IBOutlet weak var scrollView: UIScrollView!
//  a transparent clear view underneath the textView. When tap, textView will hide.
    @IBOutlet weak var emptyTransparentView: UIView!
    
//  In case, user change mind about inserting an Emoji, tap elsewhere to disable current selected Emoji.
//  Here use an empty transparent view. When tap elsewhere(tap emptyTransparentView)
//  submitButton and textView will hide
    @IBAction func backToViewButton(_ sender: UIButton) {
        textView.isHidden = true
        submitButton.isHidden = true
    }
    
//  Webserver URL
    let URL_SAVE_EMOJI = "http://linziwerle.com/insert.php"
//  Creat an Emoji array. When select an Emoji, button pressed
//  It will linked it's name(Array[value]) write into the database.
//  emoji name and symbol (or emojiSet key and value) are able to redefined by users in settings.
    let emojiSet = [ "sad" : "😢", "happy" :  "☺️" , "frustrated" : "😕" , "unhappy" :  "🙁" , "good mood" : "🙂","no feelings" : "😶"  , "funny"  :  "😄", "sneaky" : "😏" ,  "upset" : "😔"]

//  var use same names with database table structure
//  values will be inserted into the same name table column
    var name  = ""
    var writing  = ""
    var symbol  = ""
    var time  = ""
    var date  = ""
//  stats is an int which equal to button's tag value.
//  retrieve stats value for line chart.
//  set bad mood tag with 0, normal mood tag with 1, good mood tag with 2
    var stats = 0

//  Emojis are a collection button with emoji background image.
//  selectEmojis button on press to send emoji name, symbol, time, date, info
    @IBAction func selectEmojis(_ sender: UIButton) {
//  on pressed, textView pops up ask user to put their thoughts
        textView.isHidden = false
//  submitButton appears
        submitButton.isHidden = false
//  clearsOnInsertion indicates inserting text replaces the previous contents.
//  default contents = "Write any thought"
        textView.clearsOnInsertion = true
//  sender.title is emojiSet[key].
        name = (sender.title(for: .normal)!)
//  sender.tag is int indicates mood level for line chart purposes.
        stats = (sender.tag)
//  symbol is value acquired by emojiSet["key"]. symbol is the emoji.
        symbol = emojiSet ["\(name)"]!
        time = timeLabel.text ?? dateAndTime.getCurrentTime(from: Date())
        date = dateLabel.text ?? dateAndTime.getCurrentDate(from: Date())
    }
//  insertData is the same button with outlet name submitButton.
//  on press to insert symbol, name, writing, time, date, stats to database.
    @IBAction func insertData(_ sender: UIButton) {
//  writing = user's input thought.
        writing = textView.text
//  use alamofire network to post and write data.
        let parameters: Parameters =
            ["symbol" : symbol,
            "name" : name,
            "writing" : writing,
            "time" : time,
            "date" : date,
            "stats" : stats]
        Alamofire.request(URL_SAVE_EMOJI, method: .post, parameters : parameters).responseJSON{
            response in
        }
    }
//  on load, textView, submitButton is set to hide
//  dateAndTime.getCurrentDate return current date to a String.
//  dateAndTime.getCurrentTime return current time to a String.
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isHidden = true
        submitButton.isHidden = true
        scrollView.keyboardDismissMode = .onDrag
        dateLabel.text = dateAndTime.getCurrentDate(from : Date())
        timeLabel.text = dateAndTime.getCurrentTime(from : Date())
    }
}
