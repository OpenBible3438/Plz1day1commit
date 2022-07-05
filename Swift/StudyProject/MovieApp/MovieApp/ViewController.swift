//
//  ViewController.swift
//  MovieApp
//
//  Created by 편성경 on 2022/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var movieModel: MovieModel? // Model 객체는 값이 없을 수도 있어서 옵셔널

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        requestMovieAPI()
        
    }
    
    // Image Data
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void ) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        if let hasURL = URL(string: urlString) {
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            
            session.dataTask(with: request) { data, response, error in
                print( (response as! HTTPURLResponse).statusCode )
                
                if let hasData = data {
                    completion(UIImage(data: hasData))
                    return
                }
            }.resume()
            session.finishTasksAndInvalidate()
        }
        
        // data를 제어하는 로직을 타지 않았을 경우
        completion(nil)
        
    }
    
    // network API 데이터 받아오기
    func requestMovieAPI() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        var components = URLComponents(string: "https://itunes.apple.com/search")
        
        let term = URLQueryItem(name: "term", value: "marvel")
        let media = URLQueryItem(name: "media", value: "movie")
        
        components?.queryItems = [term, media]
        
        // guard : 값을 못 가져오면 else 실행
        guard let url = components?.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            //print( (response as! HTTPURLResponse).statusCode ) // 상태코드 출력
            
            // data는 옵셔널 => 파싱필요
            if let hasData = data {
                // decoder는 오류를 throws하기 때문에 try catch문으로 작성
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
                    //print(self.movieModel ?? "no data")
                    
                    // 데이터를 불러오면 TableView 업데이트
                    // 화면이 바뀌는 로직은 MainThread
                    DispatchQueue.main.async {
                        self.movieTableView.reloadData()
                    }
                } catch {
                    print(error)
                }
                
            }
            
            
        }
        task.resume() // 실행
        session.finishTasksAndInvalidate() // 통신 종료
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // numberOfRowsInSection : row 개수
        return self.movieModel?.results.count ?? 0
    }
    
    // Cell의 높이를 지정하는 override 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // return 150
        
        // contents의 크기만큼 높이를 자동지정
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 사용할 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice.description ?? ""
        cell.priceLabel.text = currency + price
        
        // image 추가
        if let hasURL = self.movieModel?.results[indexPath.row].image {
            self.loadImage(urlString: hasURL) { image in
                DispatchQueue.main.async {
                    cell.movieImageView.image = image
                }
            }
        }
        
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate {
            let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString) {
                
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy년 MM월 dd일"
                let dateString = myFormatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
                
            }
            
        }
        
        
        return cell
    }
    
    // Cell을 클릭했을 때의 이벤트 메소드
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // DetailController 연결
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        self.present(detailVC, animated: true) {
            detailVC.movieResult = self.movieModel?.results[indexPath.row]
        }
        
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
