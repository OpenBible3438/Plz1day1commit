import UIKit

/*
 Function 함수
 */

let a = 10
let b = 20

// plus 함수 정의
func testPlus(num1:Int, num2:Int) -> Int {
    return num1 + num2
}

var sum = testPlus(num1: a, num2: b)

// 튜플 형태의 리턴값
func plus2(num1:Int, num2:Int) -> (String, Int) {
    return ("결과값은", num1 + num2)
}
var result = plus2(num1: a, num2: b)

// 더 간결하게 !
func plus3(_ num1:Int,_ num2:Int) -> Int {
    return num1 + num2
}
// 파라미터 앞에 _ 언더바를 붙여주어서 선언하면 함수를 불러올 때 파라미터 명을 써주지 않아도 됨
sum = plus3(a, b)

// #####################################################################

let num1 = 10
let num2 = 20

func plus(_ num1 : Int, _ num2 : Int) -> Int {
    return num1 + num2
}

func minus(_ num1 : Int, _ num2 : Int) -> Int {
    return num1 - num2
}

func multiply(_ num1 : Int, _ num2 : Int) -> Int {
    return num1 * num2
}

// 화면에서 입력받은 연산자
var inputButtonType = "+"

if inputButtonType == "+" {
    print("연산 결과", plus(a, b) )
} else if inputButtonType == "-" {
    print("연산 결과", minus(a, b) )
} else if inputButtonType == "*" {
    print("연산 결과", multiply(a, b) )
}
// 위와 같은 코드는 유지보수 측면에서 봤을 때 효율적이지 못 함.
 
func displayCalc(result:(Int, Int) -> Int) {
    // 함수를 파라미터로 받는 경우, 파라미터 함수의 파라미터 타입과 리턴 타입을 작성
    print("연산 결과", result(a, b))
}
if inputButtonType == "+" {
    displayCalc(result: plus)
} else if inputButtonType == "-" {
    displayCalc(result: minus)
} else if inputButtonType == "*" {
    displayCalc(result: multiply)
}

/*
 Closure (클로저)
 Function과 유사
 */

// function
func myScore(a:Int) -> String {
    return "\(a)점"
}
let score = myScore(a:40) // function을 호출해서 결과값을 받아옴.

// closure
// function에는 이름이 있지만 클로저는 이름이 없음
let score2 = { (a:Int) -> String in
    return "\(a)점"
}
// score2(20)

// 클로저는 축약 / 생략
// 코드가 길지 않고 위 score2처럼 리턴줄 한 줄만 있으면 리턴 명령어를 생략할 수 있음
// 위 score2와 아래 score3는 같은 코드
let score3 = { (a:Int) -> String in
    "\(a)점"
}

// 리턴 부분의 내용으로 타입 추론이 가능하기 때문에 리턴 타입을 명시하지 않아도 됨. -> String 생략 가능함
let score4 = { (a:Int) in
    "\(a)점"
}

let score5 : (Int) -> String = { a in
    "\(a)점"
}
score5(50)

let score5_2 : (Int, Int) -> String = { (a, b) in
    "\(a + b)점"
}
score5_2(10,20)

// in 생략, 파라미터를 바로 사용
// $0은 첫 번째 파라미터를 의미. $1 , $2 , ...
// in을 생략하면 반드시 $ 사용해서 파라미터를 표시해줘야됨. in을 사용하는 문법에서는 $ 사용하면 안 됨.
let score6 : (Int) -> String = {
    "\($0)점"
    //return "\($0)점"
}
score6(100)

let score6_2 : (Int, Int, Int) -> String = {
    "\($0 + $1 + $2)점"
}
score6_2(10, 20, 30)

/* Closure 예제 */

// 특정한 글자가 있는 것 찾기
let names = ["apple", "air", "brown", "red", "ornge", "blue", "candy", "hobby"]

// 찾는 함수 선언
func someFind(find:String) -> [String] { // String으로 받아 array로 반환.
    var newNames = [String]()
    for name in names{
        if name.contains(find) { // contains : 해당 글자를 찾아서 있으면 true를 반환해줌.
            newNames.append(name)
        }
    }
    return newNames
}

someFind(find: "y")

// 찾는 글자의 첫 번째 글자만 해당되는 단어 찾는 기능을 추가하는 경우
let containsSomeText : (String, String) -> Bool = { name, find in
    if name.contains(find) {
        return true
    }
    return false
}

let isStartSomeText : (String, String) -> Bool = { name, find in
    // first로 첫 번째 글자를 찾고, description으로 String 타입으로 변환시켜줌.
    if name.first?.description == find {
        return true
    }
    return false
}

func find(condition:(String, String) -> Bool) -> [String] {
    condition
}
