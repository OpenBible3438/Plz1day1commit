import UIKit

/*
 Enumerations
 
 enum 타입분류
 */

enum Books {
    case fiction
    case comics
    case magazine
}

// 타입 인스턴스화
var myBook = Books.comics
var myBook2: Books?

/*
func selBook(book: Books) {
    
    switch book {
    case .fiction:
        print("소설책입니다.")
    case .comics:
        print("만화책입니다.")
    case .magazine:
        print("잡지입니다.")
    }
    
}
*/

// selBook(book: myBook)

enum Books2 {
    case fiction(title: String, price: Int)
    case comics(title: String, price: Int)
    case magazine(title: String, price: Int)
}

var bookList = [Books2]()

func selBook(book: Books2) {
    bookList.append(book)
}

selBook(book: .comics(title: "아이언맨", price: 15000))
selBook(book: .magazine(title: "월간낚시", price: 20000))

bookList

// bookList에 담긴 것들 사용하기
for item in bookList {
    switch item{
    case let .fiction(title, price):
        print("제목 : ", title, "가격 : ", price, "분류 - 소설")
    case let .comics(title, price):
        print("제목 : ", title, "가격 : ", price, "분류 - 만화")
    case let .magazine(title, price):
        print("제목 : ", title, "가격 : ", price, "분류 - 잡지")
    }
}

// 특정한 값만 사용하고 싶을 때,
for item in bookList {
    if case let Books2.magazine(title, price) = item {
        print("잡지만 출력")
        print("제목 : ", title, "가격 : ", price, "분류 - 잡지")
    }
}

// 작성한 enum의 기능 추가
extension Books2 {
    var typeLocation: String {
        switch self {
        case .comics:
            return "분류 - 만화 A1"
        case .fiction:
            return "분류 - 소설 B1"
        case .magazine:
            return "분류 - 잡지 C1"
        }
    }
}

print("")

for item in bookList {
    switch item{
    case let .fiction(title, price):
        print("제목 : ", title, "가격 : ", price, item.typeLocation)
    case let .comics(title, price):
        print("제목 : ", title, "가격 : ", price, item.typeLocation)
    case let .magazine(title, price):
        print("제목 : ", title, "가격 : ", price, item.typeLocation)
    }
}



/*
 Class
 */

class MyInfo {
    
    // 생성할 때 만들어 줄 수 있는 값
    init(gender: GenderType) {
        self.genderType = gender
    }
    enum GenderType {
        case male
        case female
    }
    var genderType: GenderType
    //private var genderType: GenderType // 클래스 안에서만 접근
    
    var name = ""
    var age = 0
    
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

// class 인스턴스화
var myInfo = MyInfo(gender: .female) // init
// genderType을 private으로 했으면 처음 init으로 생성하고 나서 재정의 불가능
myInfo.genderType = .male
myInfo.genderType
myInfo.age = 20

// 참조(reference type)
var myInfo2 = myInfo
myInfo2.age
myInfo2.age = 30

var myInfo3 = myInfo2

// 참조를 하게 되면 각각의 새로운 객체가 아님.
myInfo.age
myInfo2.age
myInfo3.age

class myComputer {
    
}
