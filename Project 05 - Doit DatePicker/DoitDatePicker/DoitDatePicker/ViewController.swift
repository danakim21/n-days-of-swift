//
//  ViewController.swift
//  DoitDatePicker
//
//  Created by Dayoon Kim on 2020/06/10.
//  Copyright © 2020 Dayoon Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "Selected Time: \(formatter.string(from: datePickerView.date))"
    }
    
    @objc func updateTime() {
        // lblCurrentTime.text = String(count)
        // count = count + 1
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "Current Time \(formatter.string(from: date as Date))"
    }
    
}

