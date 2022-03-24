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
        // 높이/2 하면 웒
        profileImageView.layer.cornerRadius = profileImageViewHeight/2
        
        /*
         스토리보드에 있는 요소를 코드로 구현할 때,
         처음 선언했던 참조는 그대로 남아있어서
         이름을 변경하거나 코드를 삭제 했을 때 오류가 날 수 있다.
         스토리보드 상에서 참조된 것을 삭제해야 제대로 삭제된 것 !!
         */
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
