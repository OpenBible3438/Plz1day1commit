//
//  ProfileCell.swift
//  Setting_Clone_App
//
//  Created by 편성경 on 2022/03/18.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    
    override func awakeFromNib() {
        // 생성한 Nib 파일이 메모리에 올라가는 시점 !
        super.awakeFromNib()
        // 기본 세팅 코드를 여기서 구현
        
        let profileImageViewHeight: CGFloat = 60
        // .layer.cornerRadius - 곡률 표현
        // 높이/2 하면 원형 다음어짐
        profileImageView.layer.cornerRadius = profileImageViewHeight/2
        
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottomDescription.textColor = .darkGray
        bottomDescription.font = UIFont.systemFont(ofSize: 16)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
