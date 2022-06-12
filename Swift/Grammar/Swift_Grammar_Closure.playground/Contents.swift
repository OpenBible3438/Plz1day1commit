import UIKit

// Closure
/*
 func 함수와 유사한 부분
 */
func myScore(score: Int) -> String {
    return "\(score)점"
}

// 값을 넣고 실행(호출)하는 것이 func의 기본적인 패턴
let score = myScore(score: 20) // func을 호출하고 결과값을 받아냄
score

/*
 closure를 값을 받아서 쓰게 구현했으면 함수처럼 값을 넣어 호출해주어야 함.
 */
let closureScore =  { (score: Int) ->  String in
    return "\(score)"
}
closureScore(30)

/* 축약 */

// 코드가 한 줄인 경우 return 명령어 생략
let closureScore2 =  { (score: Int) ->  String in
    "\(score)"
}
closureScore2(30)

// 리턴값을 보고 타입 추론을 해서 리턴 타입 명시 생략
let closureScore3 =  { (score: Int) in
    "\(score)"
}
closureScore3(30)

// 타입을 지정해서 구현하는 경우
let closureScore4: (Int) -> String = { a in
    "\(a)점" 
}
closureScore4(100)

// 위 방법에서 변수를 2개 받는 형태
let closureScore4_2: (Int, Int) -> String = { (a, b) in
    return "\(a), \(b)"
}
closureScore4_2(1,2)

// 파라미터로 받았던 값을 바로 사용 => in 생략
let closureScore5: (Int) -> String = { return "\($0)점" }
