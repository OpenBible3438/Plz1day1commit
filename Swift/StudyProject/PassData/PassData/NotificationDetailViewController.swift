//
//  NotificationDetailViewController.swift
//  PassData
//
//  Created by 편성경 on 2022/03/16.
//

import UIKit

class NotificationDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func nofiAction(_ sender: Any) {
        // 생성했던 Notificatino 호출
        let notificationName = Notification.Name("sendSomeString")
        
        let strDic = ["str" : "noti string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
