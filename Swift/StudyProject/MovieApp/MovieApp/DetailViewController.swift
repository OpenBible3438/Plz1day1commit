//
//  DetailViewController.swift
//  MovieApp
//
//  Created by 편성경 on 2022/07/02.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    
    // DATA MODEL
    var movieResult: MovieResult?

    // 영상을 담을 View
    @IBOutlet weak var movieContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium )
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movieResult?.trackName
        descriptionLabel.text = movieResult?.longDescription
        
        if let hasUrl = movieResult?.previewUrl {
            makePlayerAndPlay(urlString: hasUrl)
        }
        
    }
    
    // 영상 출력을 위한 함수
    func makePlayerAndPlay(urlString: String) {
        
        // 받아온 url 객체 생성
        if let hasUrl = URL(string: urlString) {
            
            // url을 영상으로 출력할 수 있게 해줌
            let player = AVPlayer(url: hasUrl)
            
            // AVPlayer 객체를 보여줄 수 있는 틀
            let playerLayer = AVPlayerLayer(player: player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            // layer의 크기는 절대값으로 지정해줘야 함
            playerLayer.frame = movieContainer.bounds
            
            player.play()
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
