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
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setCalendarUI()
        
        /* TextView */
        textView.text = "작성된 글이 없습니다."
    }
    
    func setCalendarUI() {
        /* FSCalendar */
        self.calendarView.delegate = self
        self.calendarView.dataSource = self
        
        // 월간
        self.calendarView.scope = .month
        
        // 요일 언어
        self.calendarView.locale = Locale(identifier: "ko_KR")
        
        // 요일 글자 색
        self.calendarView.appearance.weekdayTextColor = UIColor.gray
        
        // 오늘의 날짜 색
        self.calendarView.appearance.todayColor = UIColor.blue
        
        
        // 헤더
        // 헤더 날짜 포맷
        // 처음 실행될 때는 오늘 날짜
        /*
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: nowDate)
        */
        //calendarView.appearance.headerDateFormat = dateString
        
        // 다른 날짜를 클릭하면 헤더의 날짜 변경
        // 로직 추가 !
        
        // 헤더 양 옆의 글씨 투명도 (안 보이게)
        self.calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        // 헤더 폰트 색상
        self.calendarView.appearance.headerTitleColor = UIColor.gray
    }


}
