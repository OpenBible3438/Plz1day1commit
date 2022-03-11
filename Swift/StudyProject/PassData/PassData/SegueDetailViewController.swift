//
//  SegueDetailViewController.swift
//  PassData
//
//  Created by 편성경 on 2022/03/10.
//

import UIKit

class SegueDetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = dataString
    }

}
