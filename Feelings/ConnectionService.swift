

import UIKit
import Alamofire
import SwiftyJSON



class ConnectionService: NSObject {
    var serviceURL : String
   // var completionHandler: (Dictionary<String, Int>?) -> Void
    
    init(serviceURL : String){
        //completionHandler : @escaping (Dictionary<String, Int>?) -> Void) {
        self.serviceURL = serviceURL
    //    self.completionHandler = completionHandler
    }
    func loadData (PassingDate : String?, completion: @escaping( Dictionary<String, Int>?)-> Void){
        retrieveData(PassingDate: PassingDate, completion: { moodCount in
            print(moodCount)
        })
    }
    private func retrieveData(PassingDate : String?, completion: @escaping (Dictionary<String, Int>?)->()){
        let parameters : Parameters = ["PassingDate" : PassingDate!]
        Alamofire.request(self.serviceURL, method: .post, parameters : parameters).responseJSON { (response) in
            if let json = response.result.value{

                let name = (json as! NSArray).value(forKey: "name") as! NSArray
                let objCArray = NSMutableArray(array: name)
                let nameArray = objCArray.compactMap({$0 as? String})
                let mappedItems = nameArray.map {($0,1)}
                let counts = Dictionary(mappedItems, uniquingKeysWith: +)
                let moodCountDictionary = counts
                print(moodCountDictionary)
            }else{
                //self.executeCompletionHandler(moodDictionary: nil)
            }
        }
    }
    

//    private func executeCompletionHandler(moodDictionary : Dictionary<String, Int>?){
//        DispatchQueue.main.async {
//            self.completionHandler(moodDictionary)
//        }
//    }

}
