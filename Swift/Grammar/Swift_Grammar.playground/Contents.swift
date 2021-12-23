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

// Tuple
var title = ("제목1", "image1.png")
title.0
title.1

var httpError = (code:404, description:"not found") // 인덱스 번호로 구별하기 보단 설명을 쓰는게 보기 좋음
httpError.code
httpError.description

// Optional
