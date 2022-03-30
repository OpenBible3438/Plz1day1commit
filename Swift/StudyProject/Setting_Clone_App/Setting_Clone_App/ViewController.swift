//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by 편성경 on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {

    // SettingModel
    /*
     첫 번째 섹션에 1개
     두 번째 섹션에 3개
     세 번째 섹션에 ~개
     등등을 담기 위한 2중 배열 구조로 생성
     */
    var settingModel = [[SettingModel]]()

    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        // Section 1
        settingModel.append(
        [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud, the App Store, and more.", rightImageName: nil)]
        )
        
        // Section 2
        settingModel.append(
        [SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "figure.wave", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.square.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
    }
    
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
        
        // MenuCell 등록
        // 위 profileNib 등록방법과 같지만 한 줄로 짧게 !
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        // TableView 배경색 변경
        settingTableView.backgroundColor = UIColor(red: 0.835, green: 0.851, blue: 0.878, alpha: 1.000)
        
        makeData()
        
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
        //return 5
        
        // 3/30
        /*
         makeData()에서 구현한 settingModel
         각 섹션의 들어있는 개수만큼 출력되게 작성
         */
        return settingModel[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // 섹션의 개수
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cellForRowAt는 indexPath라는 순서를 통해서 어떠한 Cell을 보여줄 것인지 나타낸다.
        // TableViewCell을 리턴해야 한다.
        
        // 제일 처음 만들었던 ProfileCell 객체 생성
        /*
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        return profileCell
         */
        
        if indexPath.section == 0 {
            // 0 번째 row
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            // id 이름 "ProfileCell"을 가져온 것을 as! ProfileCell를 추가하여 강제적으로 TypeCasting
            
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName:settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        // 1번째 row(cell)부터는 MenuCell의 형태를 가짐
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = UIColor(red: 0.004, green: 0.118, blue: 0.220, alpha: 1.000)
        print("print color code",cell.leftImageView.tintColor.description)
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "" ) // optional 올 수 없어서 nil일 경우 "" 빈 스트링 넣는 코드 추가

        
        return cell
    }
    
    // 높이를 지정할 때 사용하는 함수
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 각 셀마다 높이 지정
        if indexPath.row == 0 {
            // 첫 번째는 profileCell이니까 스토리보드에서 지정한 높이대로 자동 설정
            return UITableView.automaticDimension
        }
        
        // 나머지 셀들은 다 일정한 높이 지정
        return 60
    }
    
}
