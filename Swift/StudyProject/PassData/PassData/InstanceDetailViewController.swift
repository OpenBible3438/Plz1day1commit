//
//  InstanceDetailViewController.swift
//  PassData
//
//  Created by 편성경 on 2022/03/11.
//

import UIKit

class InstanceDetailViewController: UIViewController {
    
    /*
     여기가 중요한 부분 !!
     main이 되는 나자신에 대한 인스턴스 접근
     */
    var mainVC: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
     Main ViewController에 접근해서 Main 화면에 값을 전달하기
     */
    @IBAction func sendDataMainVC(_ sender: Any) {
        mainVC?.dataLebel.text = "some data"
        
        // 화면 내림
        self.dismiss(animated: true, completion: nil)
    }
}
