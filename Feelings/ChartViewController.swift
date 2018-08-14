//
//  ChartViewController.swift
//  Feelings
//
//  Created by Cake on 7/15/18.
//  Copyright © 2018 Cake. All rights reserved.
//
import UIKit
import Charts
import Alamofire

class ChartViewController: UIViewController {
    var happy = PieChartDataEntry (value: 0)
    var sad  = PieChartDataEntry (value:0)
    var angry = PieChartDataEntry (value:0)
    var dataPie = [PieChartDataEntry]()
    var happyCount : Int = 8
    var sadCount : Int = 12
    var angryCount : Int = 2
    
    let currentDate = Date()
    var daysToSubtract : Int = 0
    var daysToAdd : Int = 0
    
    let URL_RETRIEVE = "http://linziwerle.com/service88.php"
    var emo = [Emoji]()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lineChartView: LineChartView!
    @IBAction func randomize(_ sender: UIButton) {
        let count = Int(arc4random_uniform(20) + 3)
        setChartValues(count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.chartDescription?.text = ""
        happy.value = Double(happyCount)
        happy.label = "Happy"
        sad.value = Double(sadCount)
        sad.label = "Sad"
        angry.value = Double(angryCount)
        angry.label = "Angry"
        dataPie = [happy, sad, angry]
        updateChartData()
        getCurrentDateTime()
        setChartValues()
     }
    
    func setChartValues(_ count : Int = 20){
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count)) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let set1 = LineChartDataSet(values: values, label: "DataSet1")
        let data = LineChartData(dataSet: set1)
        self.lineChartView.data = data
    }
    
    
    func alaDataPassing(){
        Alamofire.request(URL_RETRIEVE,
                          method: .get,
                          parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print()
                    return
                }
                
                guard let value = response.result.value as? [String: Any],
                    let rows = value["rows"] as? [[String: Any]] else {
                        print("Malformed ")
                        return
                }
    }
}
    func getCurrentDateTime(){
        let formatter = DateFormatter()
  //      formatter.dateStyle = .short
  //      formatter.timeStyle = .short
        formatter.dateFormat = "EEEE, MMM dd, yyyy"
        let str = formatter.string(from: Date())
        dateLabel.text = str
    }
    
    @IBOutlet weak var day: UILabel!
    @IBAction func Tomorrow(_ sender: Any) {
        daysToAdd += 1
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM dd, yyyy"
        var dateComponent = DateComponents()
        dateComponent.day = daysToAdd
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        let str = formatter.string(from: futureDate!)
        dateLabel.text = str
 }
    
    @IBAction func Yesterday(_ sender: UIButton) {
      daysToSubtract -= 1
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM dd, yyyy"
        var dateComponent = DateComponents()
        dateComponent.day = daysToSubtract
        let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        let str = formatter.string(from: pastDate!)
        dateLabel.text = str
    }
    
    @IBOutlet weak var pieChart: PieChartView!
    

    //pieChart update function
    func updateChartData(){
        let chartDataSet = PieChartDataSet(values: dataPie, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(named: "HappyColor"), UIColor(named: "ForestColor"), UIColor(named:"HoneydrewColor")]
        chartDataSet.colors = colors as! [NSUIColor]
        pieChart.data = chartData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
