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
    
    // Segue로 연결되어 있는 것(여기서는 data-segue 버튼)을 실행할 때 호출되는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegueDetail" {
            // destination : segue 화살표료 연결된 목적지 접근
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "abcd"
            }
        }
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

