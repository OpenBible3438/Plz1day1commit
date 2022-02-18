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

/* 상속 */
// ingeritance

class SportsScore {
    var teamAScore = 0
    var teamBScore = 0
    
    // final 키워드를 입력하면 상속받고 수정 불가능
    func displayScore() -> String {
        return teamAScore.description + " : " + teamBScore.description
    }
}

class Soccer : SportsScore {
    var half = "전반전"
    override func displayScore() -> String {
        return half+" "+teamAScore.description + " : " + teamBScore.description
    }
}

class Baseball : SportsScore {
    var round = 1
    override func displayScore() -> String {
        return round.description+"회차 "+teamAScore.description + " : " + teamBScore.description
    }
}

class Volleyball : SportsScore {
    var set = 1
    override func displayScore() -> String {
        return set.description+"세트 "+teamAScore.description + " : " + teamBScore.description
    }
}

let soccerPlay = Soccer()
soccerPlay.teamAScore = 1
soccerPlay.teamBScore = 2
soccerPlay.half = "후반전"
soccerPlay.displayScore()

let baseballPlay = Baseball()
baseballPlay.teamAScore = 1
baseballPlay.teamBScore = 1
baseballPlay.round = 7
baseballPlay.displayScore()

let volleyballPlay = Volleyball()
volleyballPlay.teamAScore = 10
volleyballPlay.teamBScore = 11
volleyballPlay.set = 3
volleyballPlay.displayScore()

/* Properties(property) */
// 클래스, 구조체, 열거형에 있는 변수 및 속성들.
class MyLaptop {
    /*
     프로퍼티의 종류
     - stored property(저장 프로퍼티)
     값이 저장되어 있거나 저장할 수 있는 프로퍼티
     
     - lazy stored property
     용량이 큰 변수를 선언할 경우(여러장의 이미지 등등)
     클래스를 인스턴스화하는 시점에 부화 걸릴 수 있음(오버헤드, cpu memory 과다 사용)
     클래스가 인스턴스화 하면서 모든 변수들이 메모리에 올라가게 되는데,
     이런 용량 큰 변수를 처음부터 모두 불러와서 바로 사용하지 않는 경우 lazy 키워드를 붙여서 작성한다.
     인스턴스화 시점에 메모리에 올라가지 않고,
     인스턴스화 후 실제 이 변수를 사용할 때 메모리에 올라가게 됨
     */
    let model = "MacBookPro"
    lazy var os = "Monterey"
    var osVersion = "12.0.1"
    let chip = "AppleM1Pro"
    let memory = 16
    let displaySize = 14
}

let macbook = MyLaptop()
// stored property(저장 프로퍼티)
// 값을 가져와서 사용할 수 있음
macbook.osVersion = "12.0.2"
print(macbook.model+", "+macbook.os+" ver "+macbook.osVersion)

/*
 - computed property(계산된 프로퍼티)
 특정한 값에 의해서 값이 결정되는 프로퍼티
 */
class MemberInfo {
    var name = ""
    var age = 0
    
    // coumputed property의 형태
    var isAdult:Bool {
        // 이 변수가 어떻게 만들어질 것인지 작성
        // 외부에서 값을 정할 수 없음
        // set 기능 생략이 가능하고 이 코드는 get 키워드가 생략된 경우
        get{
            if age > 19 {
                return true
            }
            return false
        }
    }
    
    // coumputed property 예제
    // 이메일을 받으면(get) 암호화된 값으로(set) 사용하는 경우
    var tempEmail = "" // 받고 내보낼 임시적인 변수 필요함
    var email: String {
        set {
            // 입력받은 값은 newValue 키워드로 축약 가능
            tempEmail = newValue
            tempEmail = newValue.hash.description
        }
        get {
            return tempEmail
        }
    }
}

let member = MemberInfo()
// member.isAdult = true

member.age = 15
member.isAdult // false 출력

member.age = 30
member.isAdult // true 출력

// computed property get set
member.email = "test@test.com"
member.email
