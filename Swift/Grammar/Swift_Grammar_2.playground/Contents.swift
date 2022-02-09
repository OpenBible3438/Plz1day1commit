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

/* Array */

var testArray = Array<String>() // Array <> 안에 어떤 타입이 들어가는지 명시해주어야함 ! (type safe )
var testArray2 = [String]() // 이런식으로 정의 가능

// Array 값 추가
var arrayName = [String]()
arrayName.append("baby")
arrayName.append("coder")
// 들어간 순서대로(0부터) index 번호에 자리를 잡음
print(arrayName[0])
print(arrayName[1])

// 방어코드, 안전한 코딩 스타일
let nameIndex = 1
if arrayName.count > nameIndex {
    arrayName[nameIndex]
}

// 추가하는 다른 방법
arrayName.append(contentsOf: ["baby2", "coder2"])
print(arrayName)

arrayName = arrayName + ["baby3", "coder3"]
print(arrayName)

// Array 값 삭제
//arrayName.remove(at: 3)
//arrayName.removeAll()
//arrayName.removeLast()
//arrayName.removeFirst()

// Array에 데이터 유무 확인
if arrayName.count == 0 {
    print("비어있는 Array")
} else if arrayName.isEmpty {
    print("비어있는 Array")
}
arrayName.isEmpty

arrayName.insert("index 1 insert", at: 1)
arrayName.insert("index 4 insert", at: 4)
print(arrayName)

// Array의 값 가져오기
for data in arrayName {
    print(data)
}

for (index, data) in arrayName.enumerated() {
    print(index, data)
}

/* Set */
// Array는 순서(index)에 따라 값을 저장하지만 Set type은 순서가 없음
var names = Set<String>()
names.insert("baby")
names.insert("coder")
names.insert("baby") // 같은 값은 들어가지 않음

// set 타입은 중복되는 값을 허용하지 않기 때문에 Array를 Set으로 형변환 하면 중복값 제거 가능
var arrayNames = ["name1", "name2", "name2", "name2"]
Set(arrayNames)
print(Set(arrayNames))

var names2: Set = ["name1", "name2", "name2", "name2"]

// Set 연산
var setTestNum1: Set = [1, 2, 3, 4, 5]
var setTestNum2: Set = [3, 4, 5, 6, 7]

// 합집합
setTestNum1.union(setTestNum2)

// 교집합
setTestNum1.intersection(setTestNum2)

// 합집합 - 교집합 (대칭차집합)
setTestNum1.symmetricDifference(setTestNum2)

// 여집합
setTestNum1.subtracting(setTestNum2)

/* Dictionary */
// 임의로 지정할 수 있는 Key와 Value로 짝을 이루며 순서가 없음
//var cafeMenu = [String : Any]()
var cafeMenu = [String : Int]()

cafeMenu["아메리카노"] = 1500
cafeMenu["아이스아메리카노"] = 2000
cafeMenu["카페라떼"] = 2500

var cafeMenu2 = ["아메리카노" : 1500, "아이스아메리카노" : 2000, "카페라떼" : 2500]

// key 확인
cafeMenu.keys

for dic in cafeMenu {
    print(dic)
}

/*
 Control Flow
 흐름제어
 */

/* for */
let alphabet = "abcdefg"

for char in alphabet {
    print(char)
}

let number = "123456789"
for char in number {
    print( ( Int(String(char)) ?? 0 ) * 10 ) // optional 때문에 값이 없는 경우 사용할 수 선언이 필요함(여기서는 값이 없는 경우 0으로 변환)
}

// Array
let names = ["pyun", "sung", "kyong"]
for name in names{
    print(name + "님")
}

for name in 0..<names.count { // 0부터 names의 요소개수를 name에 할당
    print(name)
}

// Dictionary
let cafeMenu = ["아메리카노":1500, "아아":2000]
for menu in cafeMenu {
    print(menu.key + " - " + String(menu.value) + "원")
}

// range
print("index in 0...5")
for index in 0...5 { // 0부터 5까지 index가 할당
    print(index)
}

print("index in 0..<5")
for index in 0..<5 { // 0부터 5미만까지 index가 할당
    print(index)
}

/* while */
let a = 0
/*
while (a == 0) { // a == 0 이라는 조건이 false 일 때 까지 무한히 실행 => 무한루프
    print("a == 0 true")
}
*/

var b = 0
while b < 10 {
    b += 1
    print("while문 실행 b : ", b)
}

/* switch */
let c = "c"
switch c { // 조건
case "a", "b", "c": // 케이스가 조건에 맞으면 실행
    print("a or b or c")
default: // 케이스가 조건에 다 맞지 않으면 default 실행
    print("other alphabet")
}

let d = 5
switch d {
case 1:
    print("number is 1")
case 2:
    print("number is 2")
case 3...5: // case 조건에는 범위 설정도 가능함
    print("number 3~5")
default:
    print("unknown number")
}
