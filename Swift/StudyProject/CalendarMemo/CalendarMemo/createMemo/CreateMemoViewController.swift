//
//  CreateMemoViewController.swift
//  CalendarMemo
//
//  Created by 편성경 on 2022/09/11.
//

import UIKit

/*
 메모 작성 화면
 */
class CreateMemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var closeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 키보드 상단 버튼
        addButtonOnKeyboard()
        
        // X 이미지 버튼 이벤트
        let closeTapGesture = UITapGestureRecognizer(target: self, action: #selector(closePage))
        closeImageView.isUserInteractionEnabled = true
        closeImageView.addGestureRecognizer(closeTapGesture)
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
    
    @objc func closePage() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
