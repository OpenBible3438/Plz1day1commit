//
//  ViewController.swift
//  webViewTest
//
//  Created by 편성경 on 2022/08/01.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainWebview: WKWebView!
    
    /*
     loadView()를 override하여 webView를 할당한다.
     ViewController가 가지고 있는 view를 다른 view로 지정하고 싶을 때 사용한다.
     
     보통 viewDidLoad()에서 view를 초기화해서 사용하지만
     webview의 경우에는 viewController내에서 바로 초기화하여 사용하는 게 효율적.
     */
    override func loadView() {
        super.loadView()
        
        self.view = self.mainWebview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "http://localhost:8080/") {
            let request = URLRequest(url: url)
            mainWebview.load(request)
        }
    }


}

