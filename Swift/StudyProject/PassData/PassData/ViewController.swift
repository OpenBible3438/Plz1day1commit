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
    
    /*
     2. Segue
     */
    // Segue로 연결되어 있는 것(여기서는 data-segue 버튼)을 실행할 때 호출되는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegueDetail" {
            // destination : segue 화살표료 연결된 목적지 접근
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "abcd"
            }
        }
    }
    
    /*
     3. Instance를 통채로 넘기는 방법.
     인스턴스에 직접적인 접근
     */
    
    @IBOutlet weak var dataLebel: UILabel!
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        // self가 되는 나 자신 인스턴스를 넘겨줌
        // InstanceDetailViewController에 mainViewController
        detailVC.mainVC = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    /*
     4. Delegate(delegation) Pattorn
     대리, 위임, 대신
     */
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        
        /*
         3.에 있는 Instance를 넘기는 것과의 차이점은,
         3의 self는 ViewController 타입에다가 나 자신 인스턴스를 넘기기 때문에
         모든 것에 접근이 가능하다면,
         여기서의 self는 Protocol의 규격에 맞는 것만 접근이 가능함
         ====> passString()만 접근할 수 있음 !! 
         */
        detailVC.delegate = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
}

/*
 현재 이 ViewController는
 DelegateDetailViewControllerDelegate 프로토콜을 준수하겠다는 기능 추가 !
 클래스 상단에 적어도 ㄱㅊㄱㅊ
 */
extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLebel.text = string
    }
}
