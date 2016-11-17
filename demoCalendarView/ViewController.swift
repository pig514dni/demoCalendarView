//
//  ViewController.swift
//  demoCalendarView
//
//  Created by 張峻綸 on 2016/11/16.
//  Copyright © 2016年 張峻綸. All rights reserved.
//

import UIKit
import FSCalendar
class ViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var dateLabel: UILabel!
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }()
    private let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        self.calendar.scopeGesture.isEnabled = true
        
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "2016年08月01日")!
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return self.formatter.date(from: "2017年01月31日")!
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        NSLog("change page to \(self.formatter.string(from: calendar.currentPage))")
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        NSLog("calendar did select date \(self.formatter.string(from: date))")
        dateLabel.text = self.formatter.string(from: date)

    }
    
    
    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
//        
//        let dateString = "\(date)"
//        dateLabel.text = dateString
//    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

