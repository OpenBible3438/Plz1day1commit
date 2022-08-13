//
//  ViewController.swift
//  CalendarMemo
//
//  Created by 편성경 on 2022/08/08.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        // 월간
        calendarView.scope = .month
        
        // 요일 언어
        calendarView.locale = Locale(identifier: "ko_KR")
    }


}
