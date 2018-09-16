//
//  ChartViewController.swift
//  Feelings
//
//  Created by Cake on 7/15/18.
//  Copyright © 2018 Cake. All rights reserved.
//
import UIKit
import Charts
//  ChartViewController need to retrieve selected date mood from database.
//  Convert JSON as an array, then sort array to a dictionary with key names and how many times the key names have been recorded.
//  Declare all mood name from emojiSet[key]
//  Use dictionary[key] to get the Int value.
//  Syc Int into variables


class ChartViewController: UIViewController {
//  Declare all variables from emojiSet[key]
    var happy = PieChartDataEntry (value: 0)
    var sad  = PieChartDataEntry (value:0)
    var angry = PieChartDataEntry (value:0)
    var dataPie = [PieChartDataEntry]()
    var happyCount : Int = 8
    var sadCount : Int = 12
    var angryCount : Int = 2
    var dateString = DateTimeString()
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBAction func Tomorrow(_ sender: Any) {}
    @IBAction func Yesterday(_ sender: UIButton) {}
   
    override func viewDidLoad() {
            super.viewDidLoad()
        dateLabel.text = dateString.getCurrentDate(from : Date())
        pieChartValue()
        updatePieChartData()
        setLineChartValues()

   }
    @IBOutlet weak var pieChart: PieChartView!
    
    func updatePieChartData(){
        let chartDataSet = PieChartDataSet(values: dataPie, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = [UIColor(named: "HappyColor"), UIColor(named: "ForestColor"), UIColor(named:"HoneydrewColor")]
        chartDataSet.colors = colors as! [NSUIColor]
        pieChart.data = chartData
    }
    func pieChartValue(){
        pieChart.chartDescription?.text = ""
        happy.value = Double(happyCount)
        happy.label = "Happy"
        sad.value = Double(sadCount)
        sad.label = "Sad"
        angry.value = Double(angryCount)
        angry.label = "Angry"
        dataPie = [happy, sad, angry]
    }
    
//  Line Chart example. Need to sync data by retrieving data from stats.
    @IBOutlet weak var lineChartView: LineChartView!
    func setLineChartValues(_ count : Int = 20){
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count)) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        let set1 = LineChartDataSet(values: values, label: "DataSet1")
        let data = LineChartData(dataSet: set1)
        self.lineChartView.data = data
    }
    @IBAction func randomize(_ sender: UIButton) {
        let count = Int(arc4random_uniform(20) + 3)
        setLineChartValues(count)
    }
}
