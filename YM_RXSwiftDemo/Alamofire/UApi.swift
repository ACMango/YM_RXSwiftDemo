//
//  UApi.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2022/1/4.
//

import UIKit
import Moya
import Alamofire

//MARK: API定义
enum YM_RXSwiftDemoEnum {
    
    case boutiqueList(sexType: Int) // 推荐列表
    
    case weatherCity(cityId: String) // 天气
}

let ApiProvider = MoyaProvider<YM_RXSwiftDemoEnum>()

extension YM_RXSwiftDemoEnum: TargetType {
    
    public var baseURL: URL {
        
        switch self {
          
        case .weatherCity:
            return URL(string: "http://weatherapi.market.xiaomi.com/wtr-v2/temp/realtime")!
        default:
            return URL(string: "http://app.u17.com/v3/appV3_3/ios/phone/comic/boutiqueListNew")!
        }
    }
    
    // 对应的不同的API path
    var path: String {
        switch self {
        case .weatherCity:
            return ""
        case .boutiqueList:
            return ""
        }
    }
    
    // 请求类型
    var method: Moya.Method {
        return .get
    }
    
    // 请求任务事件
    var task: Task {
        
        var parmeters: [String : Any] = [:]
        switch self {
            
            case .weatherCity(cityId: let cityId):
                parmeters["cityId"] = cityId
            
            case .boutiqueList(sexType: let sexType):
                parmeters["sexType"] = sexType
        }
        
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    // 这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
}
