//
//  ViewController.swift
//  DispatchQueue
//
//  Created by 편성경 on 2022/03/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            // 0.1초씩 반복 할 로직 구현
            self.timerLabel.text = Date().timeIntervalSince1970.description
        }
    }

    // 첫 번째 Button !
    @IBAction func action1(_ sender: Any) {
        
        print("action1() 실행")
        
        /*
         이러한 화면에서 단순히 글자, 색, 이미지 변경 같은 것들은
         MainThread에서 작동됨.
         */
        //finishLabel.text = "끝"
        
        simpleClosure {
            print("action1() 내부 simpleClosure")
            self.finishLabel.text = "끝"
        }
        
    }
    
    /*
     MainThread에서 작동되지 않는 경우
     */
    func simpleClosure(completion: @escaping () -> Void) {
        print("simpleClosure() 실행")
        
        /*
        for index in 0..<10 {
            
            // 0.1초마다 쓰레드를 멈춤
            /*
             MainThread가 멈추기 때문에 상단 시간도 잠깐 멈추게 되고
             화면상의 기능들도 작동하지 않게 됨
                  => 스크롤, 버튼 등등
             사용자 입장에서는 앱이 완전히 멈춰서 문제로 인식할 수 있음
             */
            Thread.sleep(forTimeInterval: 0.2)
            print(index)
        }
         */
        
        // MainThread가 멈추지 않게 새로운 Thread가 처리
        DispatchQueue.global().async {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        // completion()
        // MainThread에서 반드시 실행하도록 하는 로직 추가
        DispatchQueue.main.async {
            completion()
        }
    }
    
    @IBAction func action2(_ sender: Any) {
        
        /*
         DispatchQueue를 여러 개 만들기
         */
        
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "q1")
        
        /*
         sync, async
         
         sync는 순차적으로 실행됨.
         실행했던 로직이 끝나면 그 다음 로직이 실행됨.
         일반적인 코드 실행 순서와 같음 !
         
         async는 실행된 로직의 종료를 기다리지 않고 다음 로직 실행함
         
         여기서는 queue1 쓰레드에다가만 추가했기 때문에 순차적으로 진행
         */
        
        print("queue1 작업 시작")
        
        queue1.async(group: dispatchGroup) {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        queue1.async(group: dispatchGroup) {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        queue1.async(group: dispatchGroup) {
            for index in 20..<30 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        print("queue2, queue3 추가 작업 시작")
        
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        
        /*
         queue2, queue3가 각각 작업을 실행함
         */
        queue2.async(group: dispatchGroup) {
            for index in 40..<50 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        queue3.async(group: dispatchGroup) {
            for index in 50..<60 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        // 이 코드는 쓰레드가 작업을 시작하면 종료되지 않아도 실행됨
        print("queue1,2,3 코드 로직 종료")
        /*
         dispatchGroup으로 queue1,2,3으로 묶여있는 것 활용
         dispatchGroup.notify
            -> 그룹에 있는 queue들이 실행할 작업이 없을 때 로직 실행
         */
        dispatchGroup.notify(queue: DispatchQueue.main) {
            // 이 코드는 쓰레드가 모든 작업을 종료한 뒤에 실행됨
            print("dispatchGroup.notify queue1,2,3 작업 종료")
        }
        
        
    }
    
    
}

