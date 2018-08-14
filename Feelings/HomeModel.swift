//
//  HomeModel.swift
//  Feelings
//
//  Created by Cake on 8/5/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import UIKit

import Foundation
import Alamofire
protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
    }
class HomeModel: NSObject, URLSessionDataDelegate {
    weak var delegate: HomeModelProtocol!
    let urlPath: String = "http://linziwerle.com/service88.php"
  
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data){
    var jsonResult = NSArray()
    
    do{
    jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
    
    } catch let error as NSError {
    print(error)
    }
    
    var jsonElement = NSDictionary()
    let emojis = NSMutableArray()
        //emojis can be other name
    
    for i in 0 ..< jsonResult.count
    {
    
    jsonElement = jsonResult[i] as! NSDictionary
    
    let emoji = FeelingsModel() // emoji and feelingsModel
    
    if let symbol = jsonElement["symbol"] as? String,
    let name = jsonElement["name"] as? String,
    let time = jsonElement["time"] as? String,
    let writing = jsonElement["writing"] as? String{
   // let PassingDate = jsonElement["PassingDate"] as? String{
        print(symbol)
        print(name)
        print(writing)
        print(time)

     
        emoji.symbol = symbol
        emoji.name = name
        emoji.writing = writing
        emoji.time = time
       // emoji.PassingDate = PassingDate
     
     }
    emojis.add(emoji)
    }
        //what you have in your database
        DispatchQueue.main.async(execute: { () -> Void in
        self.delegate.itemsDownloaded(items: emojis)
    })
  }
}
