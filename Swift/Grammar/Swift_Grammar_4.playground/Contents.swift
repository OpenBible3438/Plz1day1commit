import UIKit

/*
 Enumerations
 
 enum 타입분류
 */

// 분류만 하는 경우
enum BookType {
    case fiction(title: String, price: Int)
    case comics(title: String, price: Int)
    case magazine(title: String, price: Int)
    case science(title: String, price: Int)
}

// enum에 기능 추가
extension BookType {
    var typeName: String {
        // 변수명 : 타입
        
        switch self {
        case .comics:
            return "comics"
        case .fiction:
            return "fiction"
        case .magazine:
            return "magazine"
        case .science:
            return "science"
        }
    }
}

var comicBookType = BookType.comics // comics type으로 지정함
var whatBookType:BookType? // 기본 타입을 정하지 않는 경우

var books = [BookType]()
func saveBook(book:BookType) {
    books.append(book)
}

/*
func loadBook(book: BookType) -> [BookType] {
    var tempBooks = [BookType]()
    
    for item in books {
        if item == book { // 파라미터로 받은 것과 books의 item이 같으면,
            tempBooks.append(item)
        }
    }
    return tempBooks
}


saveBook(book: .comics)
saveBook(book: .fiction)
saveBook(book: .magazine)
saveBook(book: .magazine)
*/

saveBook(book: .comics(title: "comics1", price: 15000))
saveBook(book: .comics(title: "comics2", price: 15000))
saveBook(book: .comics(title: "comics3", price: 15000))

saveBook(book: .fiction(title: "fiction1", price: 15000))
saveBook(book: .fiction(title: "fiction2", price: 15000))
saveBook(book: .fiction(title: "fiction3", price: 15000))

for book in books {
    
    if case let BookType.comics(title, _) = book { // 사용하지 않는 건 _ 해야 경고문 안 뜸
        //print("comics", title)
        print(title, book.typeName)
    }
    
    if case let BookType.fiction(title, _) = book { // 사용하지 않는 건 _ 해야 경고문 안 뜸
        //print("comics", title)
        print(title, book.typeName)
    }
    
    /*
    switch book {
    case let .comics(title, price):
        print(title, price)
    case let .fiction(title, price):
        print(title, price)
    default:
        break
    }
     */
}

/*
 Class
 */


