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
        
        print("app start !")
        
        /*
         6-1. Notification
         */
        let notificationName = Notification.Name("sendSomeString")
        // "sendSomeString"라고 정한 이름이 호출되면 구현부 함수를 실행시킴 !
        
        // App의 동작을 감지하는 기능
        // self - 작동되는 곳
        // #selector - 특정한 function을 호출
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        // 같은 코드로 호출 또 가능
        // NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        /*
         6-2. TextField 키보드 이벤트
         */
        // UIResponder.keyboardWillShowNotification - 키보드가 나오는 순간
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // keyboardDidShowNotification - 키보드가 나오고 난 후
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        /*
         생성했던 Notification Observer가 필요없어지는 경우
         NotificationCenter.default.removeObserver 사용하기
         */
        
    }
    
    /*
     6-1.
     Notification
     호출함수(구현부)
     */
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            // key value로 값을 가져올 수 있음.
            self.dataLebel.text = str
        }
    }
    
    // 6 Notification 화면이동 함수
    @IBAction func moveNoti(_ sender: Any) {
        let detailVC = NotificationDetailViewController(nibName: "NotificationDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
    
    /*
     6-2.keyboardWillShowNotification
     */
    @objc func keyboardWillShow() {
        print("will show")
    }
    
    @objc func keyboardDidShow() {
        print("did show")
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
    
    /*
     5. Closure
     */
    
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        // 호출한 closure body 구현
        detailVC.myClosure = { str in // 받는 파라미터 in 뒤에는 구현부
            self.dataLebel.text = str
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

/*
 4-2.
 현재 이 ViewController는
 DelegateDetailViewControllerDelegate 프로토콜을 준수하겠다는 기능 추가 !
 클래스 상단에 적어도 ㄱㅊㄱㅊ
 */
extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLebel.text = string
    }
}
