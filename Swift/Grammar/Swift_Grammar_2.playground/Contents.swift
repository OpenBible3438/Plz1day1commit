import UIKit

/* 연산자 */

/*
 기본 연산자(Basic Operators)
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

/*
 비교 연산자(Comparison Operators)
 */

a = 20
b = 20

a == b
a != b
a > b
a < b
a >= b
a <= b

if a > b {
    
} else {
    
}

/* unicode */

// 숫자만 입력받는 겨우
let inputValue = "7"
"\u{30}" // 0
"\u{39}"

if inputValue >= "\u{30}" && inputValue <= "\u{39}" {
    print("숫자입니다")
} else {
    print("숫자가 아닙니다")
}

// 영어만 입력받는 경우
"\u{41}" // A
"\u{79}" // y
// 16진수로 표현하기 때문에 79 다음은 7a(7 10)
"\u{7a}" // z

/* String */
let myName = "open bible"

for char in myName {
    print(char)
}

let myName2 = "open\nbible"
print(myName2)

// 길게 쓸 때는 큰따옴표 세개 안에 넣기
let myLongName =
"""
hello
world
open
bible
"""
print(myLongName)

let isOn = false
isOn.description // 문자열이 아닌 값들을 문자열로 만들어줌.

let descNumber = 1234
descNumber.description
// 직접적인 형변환
String(descNumber)

"descNumber is \(descNumber)" // 문자열 안에서 \() 사용하여 문자열 타입이 아닌 변수를 그대로 사용 가능

let telNo = "1234-5678"
var splitTelNo = telNo.split(separator: "-")
print(splitTelNo[0] + splitTelNo[1])

/*
 Collection Type (집합)
 - Array
 - Set
 - Dictionary
 */

// Array
var testArray = Array<String>() // Array <> 안에 어떤 타입이 들어가는지 명시해주어야함 ! (type safe )
var testArray2 = [String]() // 이런식으로 정의 가능

// Array 값 추가
var arrayName = [String]()
arrayName.append("open")
arrayName.append("bible")
// 들어간 순서대로(0부터) index 번호에 자리를 잡음
print(arrayName[0])
print(arrayName[1])
