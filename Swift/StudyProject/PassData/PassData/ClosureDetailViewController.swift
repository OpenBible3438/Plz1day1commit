//
//  ClosureDetailViewController.swift
//  PassData
//
//  Created by 편성경 on 2022/03/11.
//

import UIKit

class ClosureDetailViewController: UIViewController {
    
    var myClosure: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closurePassData(_ sender: Any) {
        
        // closure 호출
        myClosure?("closure String")
        
        self.dismiss(animated: true, completion: nil)
    }
}
