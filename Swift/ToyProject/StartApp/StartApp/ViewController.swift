//
//  ViewController.swift
//  StartApp
//
//  Created by 편성경 on 2022/03/05.
//

import UIKit

/*
 UIViewController 상속 받음
 */
class ViewController: UIViewController {
    /*
     앱 실행 단축키 - command + R
     */
    
    // storyboard에서 오브젝트를 드래그하여 변수 생성
    @IBOutlet weak var testButton: UIButton!
    
    // testButton을 클릭했을 때 액션 함수
    @IBAction func testBtnClick(_ sender: Any) {
        testButton.backgroundColor = .orange
        
        // DetailViewController로 넘어가기 위한 코드 추가
        // 클래스 인스턴스화.
        // UIViewController는 스토리보드와 연결되어 있기 때문에 인스턴스화 방식이 다름
        // 스토리보드 파일 정보 가져옴
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(identifier:"DetailViewController") as DetailViewController
        
        self.present(detailVC, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 화면이 올라갈 준비가 됐을 때 실행되는 부분
        
        testButton.backgroundColor = UIColor.red
    }


}

/*
 Class와 파일이 1:1로 있어야 하는 건 아니기 때문에,
 DetailViewController처럼 간단한 것들은 같은 파일 안에 넣어도 됨
 */
class DetailViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
