//
//  DelegateDetailViewController.swift
//  PassData
//
//  Created by 편성경 on 2022/03/11.
//

import UIKit

/*
 Instance가 없어도 대신해서 데이터를 넘겨주는 것.
 */
protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {
    
    weak var delegate: DelegateDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "delegate pass data")
        self.dismiss(animated: true, completion: nil)
    }
    
}
