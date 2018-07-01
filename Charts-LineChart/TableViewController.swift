//
//  TableViewController
//  Charts-LineChart
//
//  Created by Zach Chen on 7/01/18.
//  Copyright © 2018 Joybien Technologies Co. All rights reserved.
//

import UIKit
import Charts
class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //self.tableView.tableFooterView = UIView()
        self.tableView.separatorColor = UIColor.clear
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    var rowHeight = 0.0
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
 
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CustomChartCell", owner: self, options: nil)?.first as! CustomChartCell
        
        rowHeight = Double(cell.frame.size.height) + 20
        print(rowHeight)
        
        cell.yValues = [76, 61, 89, 12, 20, 69, 60, 53, 45, 2, 11, 48, 8, 93, 46, 38, 72, 42, 37, 27, 24, 79, 19, 62, 0, 97, 67, 70, 36, 41, 43, 40, 80, 89, 56, 90, 99, 63, 13, 51, 74, 94, 50, 32, 64, 66, 68, 18, 54, 73, 14, 26, 29, 49, 6, 47, 39, 83, 84, 92, 34, 65, 52, 82, 57, 1, 33, 16, 96, 10, 31, 77, 91, 87, 7, 81, 9, 85, 17, 5, 44, 86, 21, 22, 23, 15, 55, 25, 59, 98, 71, 95, 88, 28, 3, 30, 58, 35, 78, 4, 8, 4]
        cell.xValues = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"]
        
        cell.chtChart.leftAxis.axisMaximum = cell.yValues.max()! + 1
        cell.chtChart.leftAxis.axisMinimum = cell.yValues.min()! - 1
        
        cell.chtChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: cell.xValues)
        cell.setChart(dataPoints: cell.xValues, values: cell.yValues)
        
        cell.valLabel.text = "100"
        cell.valBTN.setTitle("test", for: .normal)
        
        return cell
    }
    
}

class MyIndexFormatter: IndexAxisValueFormatter {
    
    open override func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "\(value)"
        
    }
}
