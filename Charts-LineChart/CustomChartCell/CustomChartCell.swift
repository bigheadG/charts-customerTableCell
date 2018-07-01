//
//  CustomChartCell.swift
//  Charts-LineChart
//
//  Created by Zach Chen on 7/01/18.
//  Copyright © 2018 Joybien Technologies Co. All rights reserved.
//

import UIKit
import Charts

let appleColor = UIColor(red: 201/255, green: 252/255, blue: 17/255, alpha: 0.3)
let orangeColor = UIColor(red: 0.9882, green: 0.5725, blue: 0.098, alpha: 0.3) /* #fc9219 */
let coffeeColor = UIColor(red: 0.6078, green: 0.3529, blue: 0.0588, alpha: 0.3) /* #9b5a0f */
let blueColor   = UIColor(red: 0.1608, green: 0.1216, blue: 0.8863, alpha: 0.3) /* #291fe2 */
let bluelightColor  =  UIColor(red:0.00, green:0.58, blue:1.00, alpha:1.0)
let brownlightColor = UIColor(red:0.73, green:0.48, blue:0.20, alpha:1.0)
let violet = UIColor(red:0.68, green:0.00, blue:1.00, alpha:1.0)
let lightGreen = UIColor(red:0.25, green:0.96, blue:0.01, alpha:1.0)

class CustomChartCell: UITableViewCell {
    
    @IBOutlet weak var chtChart: LineChartView!
    
    @IBOutlet weak var valLabel: UILabel!
    
    @IBOutlet weak var valBTN: UIButton!
    
    
    var yValues  =  [Double]()
    var xValues = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        chartSetup()
  
    }
    
    func chartSetup() {
        
        
        self.chtChart.gridBackgroundColor = NSUIColor.black
        self.chtChart.drawBordersEnabled = true
        self.chtChart.rightAxis.enabled = false
        self.chtChart.rightAxis.drawAxisLineEnabled = true
        
        
        //self.chtChart.xAxis.axisMinimum = 0.0
        self.chtChart.xAxis.drawGridLinesEnabled = true
        self.chtChart.xAxis.axisLineColor = UIColor.black
        self.chtChart.xAxis.labelFont = UIFont(name: "AvenirNext-Regular", size: 12.0)!
        self.chtChart.xAxis.labelTextColor = UIColor.cyan   // lightGreen //UIColor(red: 20/255, green: 34/255, blue: 60/255, alpha: 1.0)
        self.chtChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        self.chtChart.xAxis.granularityEnabled = true
        // self.chtChart.xAxis.axisMaximum = 2
        // self.chtChart.xAxis.axisMinimum = 2
        
        self.chtChart.xAxis.spaceMin = 2
        self.chtChart.xAxis.spaceMax = 2
        self.chtChart.xAxis.labelCount = 10
        
        self.chtChart.leftAxis.enabled = true
        self.chtChart.leftAxis.drawAxisLineEnabled = false
        self.chtChart.leftAxis.labelFont = UIFont(name: "AvenirNext-Medium", size: 14.0)!
        self.chtChart.leftAxis.labelTextColor = lightGreen
        self.chtChart.leftAxis.gridColor = NSUIColor.white //.withAlphaComponent(0.3)
        //self.chtChart.leftAxis.labelPosition = YAxis.LabelPosition.insideChart
        self.chtChart.leftAxis.labelPosition = YAxis.LabelPosition.outsideChart
        self.chtChart.leftAxis.yOffset = 0
        
        //self.chtChart.leftAxis.gridLineDashLengths = [5, 5]
        //self.chtChart.leftAxis.drawLimitLinesBehindDataEnabled = true
        
        
       // self.chtChart.setViewPortOffsets(left: 0, top: 20, right: 0, bottom: 20)
        
        self.chtChart.drawGridBackgroundEnabled = true
        self.chtChart.backgroundColor = .gray
        self.chtChart.translatesAutoresizingMaskIntoConstraints = false
        self.chtChart.legend.enabled = false
        
        self.chtChart.chartDescription?.enabled = false
        self.chtChart.dragEnabled = true
        self.chtChart.setScaleEnabled(true)
        self.chtChart.pinchZoomEnabled = true
        
        viewBorder(view: self.chtChart , width:3 , round: true)
    }
    
    func viewBorder(view: UIView , width: CGFloat , round: Bool){
        if(round) {
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = true
        }
        view.layer.borderWidth = width // default 5
        view.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        chtChart.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i)+0.5, y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "")
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        
        chartDataSet.colors = [UIColor.cyan] // [NSUIColor(red: 239/255, green: 75/255, blue: 94/255, alpha: 1.0)] //Sets the colour to blue
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.lineWidth = 1
        chartDataSet.drawValuesEnabled = false
        
        chartDataSet.fillColor = UIColor.cyan
        chartDataSet.drawFilledEnabled = true
        
        chtChart.data = chartData
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
