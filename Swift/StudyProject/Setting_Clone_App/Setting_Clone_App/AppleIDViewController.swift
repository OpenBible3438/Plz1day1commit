//
//  AppleIDViewController.swift
//  Setting_Clone_App
//
//  Created by 편성경 on 2022/04/04.
//

import UIKit

class AppleIDViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func doCancel(_ sender: Any) {
        // print("Cancel Click")
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChang), for: .editingChanged)

    }
    
    @objc func textFieldDidChang(sender: UITextField) {
        if sender.text?.count == 0 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }

}
