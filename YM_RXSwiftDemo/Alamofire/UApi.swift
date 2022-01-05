//
//  UApi.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2022/1/4.
//

import Moya
import Alamofire

//MARK: API定义
enum YM_RXSwiftDemo {
    
    case boutiqueList(sexType: Int) // 推荐列表
}

let ApiProvider = MoyaProvider<YM_RXSwiftDemo>(requ)
