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
    
    // network
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 사용할 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice.description ?? ""
        cell.priceLabel.text = currency + price
        
        
        
        return cell
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
