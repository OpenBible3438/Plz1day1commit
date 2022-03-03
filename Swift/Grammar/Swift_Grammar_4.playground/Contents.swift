import UIKit
import Darwin
import Foundation

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

/*
 Initializer
 생성자
 
 init 키워드 사용
 */

class Myinfo2 {
    
    // 초기값 세팅을 안 하는 프로퍼티들은 init으로 값 설정이 필수
    var name: String
    var myId: String
    var age = 0
    var isAdult: Bool
    
    // designated initializer
    // 클래스를 생성하는 시점에 값을 세팅하려는 것.
    init(name: String, id: String) {
        self.name = name
        self.myId = id
        self.isAdult = (age > 19) ? true : false // 삼항연산자. (이 값이 true? )? true여기실행 : false여기실행
    }
    
    // 그냥 init은 초기값 세팅을 다 해줘야해서 여러개를 작성하게 되면 코드가 길어지고 복잡해짐
    init(id: String) {
        self.name = ""
        self.myId = id
        self.isAdult = (age > 19) ? true : false
    }
    
    // convenience initializer
    // 필수조건 - 다른 init을 반드시 실행.
    // init 하나에 추가적인 기능은 convenience init으로 작성하면 훨씬 간결해짐.
    convenience init() {
        self.init(name: "", id: "") // 위에 작성했던 init을 실행함
    }
    

    
}

// var myinfo2 = Myinfo2.init(name: "kim", id: "kim123") // .init 생략
var myinfo2 = Myinfo2(name: "kim", id: "kim123")

myinfo2.myId
myinfo2.name

struct MyConfig {
    var conf: String
}
// var myCon = MyConfig.init(conf: "test") // 마찬가지로 .init 생략되어 있음.
var myCon = MyConfig(conf: "test") // struct 코드작성할 때 초기값을 세팅하지 않아도 생성할 때 자동으로 init 생성

// Deinitialization
// 해제 (메모리 해제)
// 메모리 해제하는 것이 꼭 좋은 것은 아니기 때문에 필요한 경우에만 사용. 대부분 해제하지 않고 올린대로 사용하게 됨
var a: Int? = 10 // a 변수에 optional int 10 메모리 올림
a = nil // nil 주면서 메모리에서 해제됨

class Game {
    var score = 0
    var name = ""
    var round: Round? // Round에 대한 내용이 많아서 Game 클래스에 모두 만들지 않고, Round 클래스를 따로 만듦.
    
    // 생성할 때 호출되는 기능
    init() {
        print("Game init")
    }
    // 해제할 때 호출되는 기능
    deinit {
        print("Game Deinit")
    }
}

class Round {
    var name = ""
    var lastRound = 10
    var roundTime = 20
}

var game: Game? = Game()
game = nil // 필요하지 않을 때 deinit(해제) 해주면 메모리 사용량을 늘릴 수 있음

/*
 Structure
 구조체
 
 형태는 class와 비슷하고 기능적으로 다른 점이 있음
 - class는 참조형(레퍼런스 타입),
    구조체는 value type. 값을 참조하지 않고 복제함
 - 상속 안 됨
 */

struct SomeStruct {
    var name = ""
    func someFunc() {
        
    }
}

struct ImageType {
    var type = ""
}

var imageType1 = ImageType()
var imageType2 = imageType1 // 값을 참조하지 않고 복제 ! (참조형이 아님)
imageType1.type = "jpg"
imageType2.type = "png"
imageType1.type
imageType2.type
// 연결되어 있는 구조가 아닐 때 class가 아닌 구조체를 사용

/*
 Extension
 기능 확장
 
 class, struct, enum, protocol 등등 대부분 모든 것에 사용가능
 */

// Int Type에 짝수, 홀수 판별 기능 추가
extension Int { // 기본 내장된 Type에도 기능 추가할 수 있음
    var oddOrEven: String {
        if self % 2 == 0 {
            return "짝수"
        }
        return "홀수"
    }
}
3.oddOrEven
4.oddOrEven

// 앱에서 자주 쓰이는 색이 있는 경우
// UIColor
// mainColor1 = .....
// mainColor2 = .....
// subColor1 = .....
extension UIColor {
    var mainColor1: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
    }
    
    // UIColor.orange 같은 기본 변수들은 class 변수로 선언되어있음
    class var mainColor2: UIColor {
        UIColor(red: 40/255, green: 10/255, blue: 20/255, alpha: 1)
    }
    // 비슷하게 static
    static var mainColor3: UIColor {
        UIColor(red: 20/255, green: 90/255, blue: 90/255, alpha: 1)
    }
}
var button = UIButton()
// 일반 변수로 선언하면 UIColor 인스턴스화 필요
button.titleLabel?.textColor = UIColor().mainColor1

// class 변수로 선언하면 인스턴스화 필요없이 바로 사용
button.titleLabel?.textColor = UIColor.mainColor2
button.titleLabel?.textColor = .mainColor2

// static 변수
button.titleLabel?.textColor = .mainColor3

/*
 Protocol
 규격, 규약, 규칙, 청사진, 뼈대
 
 원하는 스타일을 규격화하여 원하는 곳에서 구현부 작성
 */
protocol UserInfo {
    // get(필수), set 필요
    // 구현 부분은 작성할 수 없고 선언만 가능함
    var name: String { get set }
    var age: Int { get set }
    
    func isAdult() -> Bool
}

class ProtocolMember: UserInfo {
    // protocol을 갖게 되면 해당 protocol의 요소들을 필수적으로 가져옴
    var name: String = ""
    var age: Int = 0
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

class ProtocolMember2: UserInfo {
    var name: String
    var age: Int
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

/*
 Inheritance
 상속
 */
class InheritanceUserInfo {
    var name = ""
    var age = 0
    
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

class InheritanceGuest: InheritanceUserInfo {
    // override - 상속 받은 함수 그대로 사용하지 않고 재정의하여 사용
    override func isAdult() -> Bool {
        return true
    }
    
    func present(){
        name = "name1"
        print(name)
        
        // 상속 받은 곳(부모 class)에 접근
        print(super.name)
        // 상속은 부모 클래스의 접근해서 그 요소를 사용하기 때문에 부모의 값도 바뀌게 됨
        // => protocol과 다른 점
        
        // override 했기 때문에 부모와 다르게 출력
        print(isAdult())
        print(super.isAdult())
    }
}
let inheGuest = InheritanceGuest()
inheGuest.present()

/*
 Generic <내가 만드는 임의의 Type>
 로직을 반복해야 될 때 보통 func 함수를 선언하게 되는데
 타입을 여러가지로 쓰여야 되는 경우 사용
 */

// stack
struct IntStack {
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int? {
        if items.isEmpty {
            // 꺼낼 데이터가 없는 경우
            return nil
        }
        return items.removeLast()
    }
}

var myStack = IntStack()
myStack.push(item: 1)
myStack.push(item: 2)
myStack.push(item: 3)
// struct IntStack의 push는 Int타입만 넣을 수 있게 만들어서
// myStack.push(item: "one") 같은 String 타입은 넣을 수 없음
// => generic 구조로 가능하게 만들 수 있음

myStack.pop()
myStack.pop()
myStack.pop()

// generic stack
// 여기서는 MyType이라는 임의의 타입으로 작성했지만,
// 실제 코드를 실행할 때는 정확한 타입을 명시해줘야 함.
struct GenericStack<MyType> {
    var items = [MyType]()
    
    mutating func push(item: MyType) {
        items.append(item)
    }
    mutating func pop() -> MyType? {
        if items.isEmpty {
            // 꺼낼 데이터가 없는 경우
            return nil
        }
        return items.removeLast()
    }
}

// String Type
var myStack2 = GenericStack<String>()
myStack2.push(item: "a")
myStack2.pop()

var myStack2_Int = GenericStack<Int>()
myStack2_Int.push(item: 1)
myStack2_Int.pop()

// generic에 제한을 두어야 하는 경우
struct GenericStack2<MyType> where MyType: Numeric {
                    // Numeric - int, double, .. 숫자형들 가능
                    // StringProtocol
                    // Equatable
    var items = [MyType]()
    
    mutating func push(item: MyType) {
        items.append(item)
    }
    mutating func pop() -> MyType? {
        if items.isEmpty {
            // 꺼낼 데이터가 없는 경우
            return nil
        }
        return items.removeLast()
    }
}

/*
 Higher order function
 고차함수
 */
let names = ["kim", "lee", "park", "choi", "pyun"]

// Map
let names2 = names.map { name in
    name + "님"
}
let names2_2 = names.map {
    $0 + "님"
}

let names3 = names.map { name in
    name.count
}

let names4 = names.map { name in
    name.count > 3
}

// Filter
let filterName = names.filter{ (name) -> Bool in
    name.count > 3
}

// Reduce 합치기
let reduceName = names.reduce("시작") { (first, second) in
    first + second
}

let reduceName2 = names.reduce("시작부") { $0 + $1 }
reduceName2

let reduceNumberArr = [1,2,3,4,5]
let reduceNumber = reduceNumberArr.reduce(0){$0 + $1}

// CompactMap nil, optional 값 없앰
let compactArr = [1,2,3,4,5, nil, 6, nil, 8]
let compactNum = compactArr.compactMap{ (num) in
    return num
}

// Flatmap 모두 꺼내서 같은 depth로 나열
let flatArr = [[1,2,3], [4,5,6]]
let flatNum = flatArr.flatMap{$0}
flatNum
