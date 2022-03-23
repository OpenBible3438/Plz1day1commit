//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by 편성경 on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 선언한 TableView 사용을 위한 선언
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        /*
         추가한 ProfileCell (nib파일) 가져오기(등록).
         storyboard에서 Identifier를 지정할 수 있는데 생성한 이름과 동일하게 짓는 것이 좋음
         */
        let profileNib = UINib(nibName: "ProfileCell", bundle: nil)
        settingTableView.register(profileNib, forCellReuseIdentifier: "ProfileCell")
        
    }


}

/*
 TableView Protocol
 */
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // numberOfRowsInSection는 몇 개의 cell을 구현할지를 나타내줘야 한다.
        // Int 값을 리턴해야 되기 때문에 단순히 숫자를 써도 되지만
        // CellCount 변수를 사용하는 것이 좋다.
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cellForRowAt는 indexPath라는 순서를 통해서 어떠한 Cell을 보여줄 것인지 나타낸다.
        // TableViewCell을 리턴해야 한다.
        
        // 제일 처음 만들었던 ProfileCell 객체 생성
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        return profileCell
    }
    
    
}
