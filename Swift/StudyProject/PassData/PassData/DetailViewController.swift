//
//  DetailViewController.swift
//  PassData
//
//  Created by 편성경 on 2022/03/07.
//

import UIKit

class DetailViewController: UIViewController {
    
    var someString = ""
    
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = someString
    }

}
