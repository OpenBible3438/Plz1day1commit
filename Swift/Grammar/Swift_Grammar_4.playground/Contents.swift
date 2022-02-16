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

// class 선언
class MyInfo {
    // class 초기화
    init(gender: GenderType) {
        self.genderType = gender
    }
    // Class 내부에는 변수, 함수, 열거형 등등 선언할 수 있음
    enum GenderType {
        case male
        case female
    }
    //var genderType = GenderType.male
    // private로 변경
    private var genderType:GenderType?
    
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
var myInfo = MyInfo(gender: .female)

// 접근할 수 없기 때문에 오류가 남
// myInfo.genderType = .male

// 클래스는 참조형.
myInfo.age = 20

var myInfo2 = myInfo
myInfo2.age
myInfo2.age = 30

// 30
myInfo.age

// 상속
// ingeritance

class SportsScore {
    var teamAScore = 0
    var teamBScore = 0
    
    func displayScore() -> String {
        return teamAScore.description + " : " + teamBScore.description
    }
}

class Soccer : SportsScore {

}

class Baseball : SportsScore {

}

class Volleyball : SportsScore {

}

let soccerPlay = Soccer()
soccerPlay.teamAScore = 1
soccerPlay.teamBScore = 2
soccerPlay.displayScore()

let baseballPlay = Baseball()
baseballPlay.teamAScore = 30
baseballPlay.teamBScore = 35
baseballPlay.displayScore()

let volleyballPlay = Volleyball()
volleyballPlay.teamAScore = 40
volleyballPlay.teamBScore = 50
volleyballPlay.displayScore()
