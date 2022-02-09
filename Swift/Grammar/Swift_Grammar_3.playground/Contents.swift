import UIKit

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

