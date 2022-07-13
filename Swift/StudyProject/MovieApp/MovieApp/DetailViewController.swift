//
//  DetailViewController.swift
//  MovieApp
//
//  Created by 편성경 on 2022/07/02.
//

import UIKit

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
