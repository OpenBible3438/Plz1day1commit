import UIKit

/* 연산자 */

/*
 기본 연산자(Basic Operator)
 + - * / %
 */
var a:Double = 20
var b:Double = 30

//let c = a + b => Int 타입을 나눌 경우, 딱 떨어지지 않는 이상 오류가 나기 쉽기 때문에 타입 지정을 해주자.
var c = a / b

/*
 let a:Int = 20
 let b:Double = 30
 let c = a + b
 위와 같이 다른 타입으로 연산하면 오류가 남
 Swift 언어 특징 - Type Safe(타입 엄격, 강타입 )
 */
var a2:Double = 20
var b2:Int = 31

var c2 = Int(a2) + b2

// 나머지 %
// 홀 짝
if b2 % 2 == 0 {
    print("짝수입니다.")
} else {
    print("홀수입니다.")
}
