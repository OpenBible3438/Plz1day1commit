//
//  CreateMemoViewController.swift
//  CalendarMemo
//
//  Created by 편성경 on 2022/09/11.
//

import UIKit
import FirebaseFirestore

/*
 메모 작성 화면
 */
class CreateMemoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var topDateLabel: UILabel!
    
    var selectedDate: Date? = nil
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = ""
        
        // 화면 상단 Date
        let topDateFormatter = DateFormatter()
        topDateFormatter.dateFormat = "yyyy.MM.dd."
        if selectedDate == nil {
            // nil인 경우 오늘 날짜
            let nowDate = Date()
            topDateLabel.text = topDateFormatter.string(from: nowDate)
        } else {
            topDateLabel.text = topDateFormatter.string(from: selectedDate!)
        }
        
        // Firebase Data 불러오기
        getMemoContents(selectedDate: selectedDate)
        
        // 키보드 상단 버튼
        addButtonOnKeyboard()
        
        // X 이미지 버튼 이벤트
        let closeTapGesture = UITapGestureRecognizer(target: self, action: #selector(closePage))
        closeImageView.isUserInteractionEnabled = true
        closeImageView.addGestureRecognizer(closeTapGesture)
    }
    
    // 화면 열릴 때 Firebase 메모 데이터 불러오기
    func getMemoContents(selectedDate: Date?) {
        let getMemoDateFormatter = DateFormatter()
        getMemoDateFormatter.dateFormat = "yyyyMMdd"
        
        var getMemoDate: String
        if selectedDate == nil {
            let nowDate = Date()
            getMemoDate = getMemoDateFormatter.string(from: nowDate)
        } else {
            getMemoDate = getMemoDateFormatter.string(from: selectedDate!)
        }
        
        let docRef = db.collection("MEMO").document(getMemoDate)
        docRef.getDocument() { (document, error) in
            if let document = document, document.exists {
                // 메모 존재
                let getContents = document.data()!["contents"] as! String
                self.memoTextView.text = getContents
            } else {
                // 메모 없음
                // PlaceHolder Setting
                self.memoTextView.delegate = self
                self.memoTextView.text = "글을 입력해 주세요"
                self.memoTextView.textColor = UIColor.lightGray
            }
        }
    }
    
    // 키보드 상단에 작성 버튼 추가
    func addButtonOnKeyboard() {
        let toolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let writeBtn = UIBarButtonItem(title: "작성", style: .done, target: self, action: #selector(self.writeBtnAction))
        
        let items = [flexSpace, writeBtn]
        toolBar.items = items
        toolBar.sizeToFit()
        
        memoTextView.inputAccessoryView = toolBar
    }
    
    @objc func writeBtnAction() {
        print("메모 작성 완료")
    }
    
    /*
     TextView Delegate
     */
    // TextView에 Text 입력을 시작할 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        if memoTextView.textColor == UIColor.lightGray {
            memoTextView.text = nil
            memoTextView.textColor = UIColor.black // lightGray였던 글자색 다시 변경
        }
    }
    // TextView Text 입력을 끝냈을 때
    func textViewDidEndEditing(_ textView: UITextView) {
        // 입력을 끝냈을 때 아무 내용도 없다면 다시 PlaceHolder 효과 주기
        if memoTextView.text.isEmpty {
            memoTextView.text = "글을 입력해 주세요"
            memoTextView.textColor = UIColor.lightGray
        }
    }
    
    @objc func closePage() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
