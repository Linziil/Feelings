//
//  DataPassAlamofire.swift
//  Feelings
//
//  Created by Cake on 9/4/18.
//  Copyright © 2018 Cake. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct DataPassAlamofire{
    let URL_RETRIEVE = "http://linziwerle.com/getInt.php"
    var moodCountDictionary : Dictionary<String, Int> = [:]
    func dataPassingFromAlamofire(PassingDate : String) -> Void {
        let parameters : Parameters = ["PassingDate" : PassingDate]
        Alamofire.request(URL_RETRIEVE, method: .post,parameters : parameters).responseJSON{
            response in
            guard let json = response.result.value else {return}
            let name = (json as! NSArray).value(forKey: "name") as! NSArray
            let objCArray = NSMutableArray(array: name)
            let nameArray = objCArray.compactMap({$0 as? String})
            let mappedItems = nameArray.map {($0,1)}
            let counts = Dictionary(mappedItems, uniquingKeysWith: +)
            let moodCountDictionary = counts
            print(moodCountDictionary)
            
        }
    }
    
    
}

