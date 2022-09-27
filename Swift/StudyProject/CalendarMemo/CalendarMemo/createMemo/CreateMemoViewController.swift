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
    
    var mainVC: ViewController?
    
    var isWriteMemo: Bool! = false // 텍스트 필드에 메모를 작성했는지 확인
    var isHaveMemo: Bool! = false // 해당 날짜에 메모가 이미 있는지 확인
    
    var selectedDate: Date? = nil
    var yyyyMMddFormatedDate: String! = nil
    
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
        
        // yyyyMMdd 포맷팅한 날짜 전역변수에 담기
        yyyyMMddFormatedDate = getMemoDate
        
        let docRef = db.collection("MEMO").document(getMemoDate)
        docRef.getDocument() { (document, error) in
            if let document = document, document.exists {
                // 메모 존재
                let getContents = document.data()!["contents"] as! String
                self.memoTextView.text = getContents
                
                self.isHaveMemo = true
            } else {
                // 메모 없음
                // PlaceHolder Setting
                self.memoTextView.delegate = self
                self.memoTextView.text = "글을 입력해 주세요"
                self.memoTextView.textColor = UIColor.lightGray
                
                self.isHaveMemo = false
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
        let docRef = db.collection("MEMO").document(yyyyMMddFormatedDate)
        let memoContents: String? = memoTextView.text
        
        if memoContents == nil || memoContents == "" || memoContents == "글을 입력해 주세요" {
            isWriteMemo = false
        } else {
            isWriteMemo = true
        }
        
        // Firebase 메모 입력하기
        if isHaveMemo {
            // 해당 날짜에 이미 메모가 있던 상태 UPDATE
            if isWriteMemo {
                // UPDATE
                docRef.updateData([
                    "contents" : memoContents ?? ""
                ]) { err in
                    if let err = err {
                        print("ERROR UPDATING DOC : \(err)")
                        self.closePage()
                    } else {
                        print("MEMO UPDATE")
                        self.mainVC?.contentsText.text = memoContents
                        self.closePage()
                    }
                }
            } else {
                // 아무것도 안 작성했으면 해당 날짜 data 삭제
                
            }
        } else {
            // 해당 날짜에 새로운 메모 INSERT
            if isWriteMemo {
                // INSERT
                docRef.setData([
                    "date" : yyyyMMddFormatedDate ?? "",
                    "contents" : memoContents ?? ""
                ]) { err in
                    if let err = err {
                        print("ERROR UPDATING DOC : \(err)")
                        self.closePage()
                    } else {
                        print("MEMO INSERT")
                        self.mainVC?.contentsText.text = memoContents
                        self.closePage()
                    }
                }
            } else {
                // 아무것도 안 작성했으면 화면 닫기
                closePage()
            }
        }
    }
    
    /*
     TextView Delegate
     */
    // TextView에 Text 입력을 시작할 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        if memoTextView.textColor == UIColor.lightGray {
            memoTextView.text = nil
            memoTextView.textColor = UIColor.black // lightGray였던 글자색 다시 변경
            
            isWriteMemo = true
        }
    }
    // TextView Text 입력을 끝냈을 때
    func textViewDidEndEditing(_ textView: UITextView) {
        // 입력을 끝냈을 때 아무 내용도 없다면 다시 PlaceHolder 효과 주기
        if memoTextView.text.isEmpty {
            memoTextView.text = "글을 입력해 주세요"
            memoTextView.textColor = UIColor.lightGray
            
            isWriteMemo = false
        }
    }
    
    @objc func closePage() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
