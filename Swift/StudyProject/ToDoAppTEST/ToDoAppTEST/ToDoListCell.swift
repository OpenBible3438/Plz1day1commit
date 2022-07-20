//
//  ToDoListCell.swift
//  ToDoAppTEST
//
//  Created by 편성경 on 2022/07/20.
//

import UIKit

protocol CheckingDelegate: AnyObject {
    func checkBtnAction()
}

class ToDoListCell: UITableViewCell {
    
    var chkDelegate: CheckingDelegate?
    
    @IBOutlet weak var chkBtn: UIButton!
    @IBOutlet weak var contLabel: UILabel! {
        didSet {
            contLabel.font = .systemFont(ofSize: 13, weight: .medium)
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = .systemFont(ofSize: 8, weight: .light)
        }
    }
    
    @IBAction func checkBtnAction(isChecked: Bool) {
        if(isChecked) {
            print("체크 됨 !")
        } else {
            print("체크 안 됨 !")
        }
    }
    
}
