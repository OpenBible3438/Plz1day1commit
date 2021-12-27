import UIKit

/** 변수 & 상수  **/

/*
 swift 언어의 특징
    - type safe
 */

// 변수
var greeting = "Hello, playground"

// 상수
let userName = "openbible"

/*
 Type Annotations
 위 변수들처럼 값을 넣으면 그 값으로 인해 어떤 Type인지 추론하는데,
 어떤 Type인지 주석을 넣어 직접적으로 표시하는 것.
 */
var str:String = "String Annotation Test"
var age:Int = 25

// Boolean
var isTrue = false

if isTrue { // isTrue == true 와 같은 코드
    
} else {
    
}

// Optional
// 값이 있을수도 없을수도 !
var optionalStr : String?
print(optionalStr) // nil(null) 상태

optionalStr = "have value"
print(optionalStr)


// Optional Binding
// Optional 변수의 값이 있는지 없는지 검사한 후 값을 대입

// Tuple
var title = ("제목1", "image1.png")
title.0
title.1

var httpError = (code:404, description:"not found") // 인덱스 번호로 구별하기 보단 설명을 쓰는게 보기 좋음
httpError.code
httpError.description

// Array Dictionary
var cafe = ["스타벅스", "투썸플레이스", "이디야"]
var menu = [
    "아메리카노" : 4000,
    "카페라떼" : 4500,
    "자허블" : 5000
]

// 빈 Array Dictionary
var nullArray : [String] = []
var nullDic : [String : String] = [:]

// 조건문 & 반복문
var score = 70
var grade = ""

if score >= 90 && score <= 100 {
    grade = "A"
} else if score >= 80 {
    grade = "B"
} else if score >= 70 {
    grade = "C"
} else if score >= 60 {
    grade = "D"
} else {
    grade = "F"
}
print(grade)

for i in cafe {
    print(i)
}

for (menuName, menuPrice) in menu{
    print("\(menuName)의 가격은 \(menuPrice)원 입니다.")
}

for _ in 0..<5{
    print("count")
}

var testNum = 0
while testNum < 10{
    print(testNum)
    testNum += 1
}

var num:Int?
var resultNum = (num ?? 0)
print(resultNum)
