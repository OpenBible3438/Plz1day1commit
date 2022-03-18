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
            dispatchGroup.enter() // 작업 시작을 알림
            for index in 40..<50 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            dispatchGroup.leave() // 작업 종료를 알림
            
            /*
             enter()와 leave()를 반드시 함께 사용해야 된다.
             enter()는 있고 leave()가 없으면
             Thread가 제대로 종료되지 않은 채
             백그라운드에서 계속 돌고 있을 수 있음 !
             */
            
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
        
    } // button2 action2
    
    @IBAction func actino3(_ sender: Any) {
        
        print("action3() 실행")
        
        // 화면에 대한 요소를 변경하려면 MainThread
        // MainThread는 계속 앱이 돌아가야 되기 때문에
        // 아래와 같이 main.sync는 사용 불가능
        /*
        DispatchQueue.main.sync {
            // code
        }
        */
        
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        queue1.sync {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        queue2.sync {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        
        // Deadlock 발생하는 경우
        // 상대 작업이 끝날 때까지 계속 기다리는 상태
        /*
        queue1.sync { // queue1-1
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            
            queue1.sync { // queue1-2
                for index in 10..<20 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
            }
            
        } // queue1-1의 작업이 끝나는 지점
         */
        /*
         queue1 sync 작업 상태 안에
         같은 queue1 sync 작업을 추가하게 되면
         queue1-2는 1-1의 작업이 끝나고 나서 작업을 시작해야되는데
         시작할 수 없는 상태, 계속 1-1의 작업 종료를 기다리는
         deadlock 발생하게 됨
         */
        
    } // button3 actino3
    
    @IBAction func action4(_ sender: Any) {
        
        /*
         우선순위 QOS
         */
        
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        
        print("action4() 실행")
        
        /*
         DispatchQoS 정의된 곳에 들어가보면
         background,utility,default,userInitiated,userInteractive
         순서대로 우선순위가 높은 것을 확인할 수 있음
         unspecified은 잘 사용하지 않음
         */
        queue1.async(group: dispatchGroup, qos: .background) { // 가장 낮은 우선순위
            dispatchGroup.enter()
            print("qos: .background")
            DispatchQueue.global().async {
                for index in 0..<10 {
                    print(index)
                }
            }
            dispatchGroup.leave()
        }
        
        queue2.async(group: dispatchGroup, qos: .userInteractive) { // 가장 높은 우선순위
            dispatchGroup.enter()
            print("qos: .userInteractive")
            DispatchQueue.global().async {
                for index in 10..<20 {
                    print(index)
                }
            }
            dispatchGroup.leave()
        }
        
        queue3.async(group: dispatchGroup, qos: .default) { // 기본 우선순위
            dispatchGroup.enter()
            print("qos: .default")
            DispatchQueue.global().async {
                for index in 20..<30 {
                    print(index)
                }
            }
            dispatchGroup.leave()
        }
        
        print("action4() 실행 종료")
        
    } // button4 action4
    
} // ViewController

