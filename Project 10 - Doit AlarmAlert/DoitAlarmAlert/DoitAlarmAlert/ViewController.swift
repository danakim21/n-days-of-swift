//
//  ViewController.swift
//  DoitAlarmAlert
//
//  Created by Dayoon Kim on 2020/06/13.
//  Copyright © 2020 Dayoon Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var alertFlag = false
    
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
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "Current Time \(formatter.string(from: date as Date))"
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        if (alarmTime == currentTime) {
            if (!alertFlag) {
                let lampOnAlert = UIAlertController(title: "Alert", message: "It's time!", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title:"Yes", style: UIAlertAction.Style.default, handler: nil)
                lampOnAlert.addAction(onAction)
                present(lampOnAlert, animated: true, completion: nil)
                alertFlag = true
            }
        } else {
            alertFlag = false
        }
    }
}

