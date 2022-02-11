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
