//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by 편성경 on 2022/04/03.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // emailTextField에 글자가 입력되면 Next버튼이 활성화되는 기능
        /*
         addTarget
         - target : 실행할 함수의 위치.
                    지금 여기 ViewController에 선언된 경우 self
                    다른 곳에 있거나 공통 클래스에 있으면 해당 위치
         - action : 실행할 함수의 이름.
                    #selector() 괄호 안에 함수명 기입.
                    이 함수에는 @objc 넣어줘야 됨.
         - for : event
                 여기서 사용한 editingChanged는 글자가 입력되거나 삭제될 때마다 함수를 호출시킨다.
                자주 사용하는 것 중 하나 !
         
         */
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        print(sender.text ?? "값 없음")
    }


}
