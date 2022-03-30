//
//  SettingModel.swift
//  Setting_Clone_App
//
//  Created by 편성경 on 2022/03/25.
//

import Foundation

// struct 구조
struct SettingModel {
    /*
     첫 번째 섹션에 사용자의 정보가 들어가는 부분은 subTitle이 들어가지만
     나머지 섹션에서는 subTitle이 있지않고 menuTitle만 존재한다.
     
     그리고 첫 번째 섹션에는 오른쪽에 화살표 이미지가 없지만
     나머지 섹션에는 오른쪽에 화살표 이미지가 있다
     
     => subTitle, rightImageName은 optional로 생성
     */
    var leftImageName: String = ""
    var menuTitle: String = ""
    var subTitle: String?
    var rightImageName: String?
}
