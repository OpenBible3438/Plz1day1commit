//
//  GeneralViewController.swift
//  Setting_Clone_App
//
//  Created by 편성경 on 2022/03/31.
//

import UIKit

/*
 보통 한 swift 파일 하나에는 class 하나만 있는 것이 일반적
 틀린 코드는 아니지만 간결하게 작성 가능
 */

let commonProperty = CommonProperty()

class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    
    /*
     여기서 오른쪽 화살표 이미지는 전체적으로 변하지 않는 고정된 값
     바로 코딩을 해도 무방함
     */
    @IBOutlet weak var rightImageView: UIImageView! {
        didSet{
            rightImageView.image = UIImage.init(systemName: "chevron.right")
            
            rightImageView.tintColor = commonProperty.appMainColor
        }
    }
    
    
}

struct GeneralModel {
    var leftTitle = ""
}

class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var generalModel = [[GeneralModel]]()
    
    // 각 섹션 안에 들어있는 row의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generalModel[section].count
    }
    
    // 섹션의 수
    // model.append의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return generalModel.count
    }
    
    // 만든 cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.leftLabel.text = generalModel[indexPath.section][indexPath.row].leftTitle
        
        return cell
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        self.title = "General"
        
        // 상단 title 가림
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        // 화면 Color
        generalTableView.backgroundColor = commonProperty.appBackgrountColor
        
        generalTableView.delegate = self
        generalTableView.dataSource = self
        
        generalModel.append([GeneralModel(leftTitle: "About")])
        
        generalModel.append(
            [GeneralModel(leftTitle: "Keyboard"),
            GeneralModel(leftTitle: "Game Controller"),
            GeneralModel(leftTitle: "Fonts"),
            GeneralModel(leftTitle: "Language & Region"),
            GeneralModel(leftTitle: "Dictionary")]
        )
        generalModel.append(
        [GeneralModel(leftTitle: "Reset")]
        )
        
    }

}
