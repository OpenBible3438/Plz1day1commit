//
//  ViewController.swift
//  PassData
//
//  Created by 편성경 on 2022/03/07.
//



import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        /*
         Passing Data 데이터를 넘겨주는 방법
         1. instance property
         */
        detailVC.someString = "this is passing data"
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

