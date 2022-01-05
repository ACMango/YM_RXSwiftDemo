//
//  U17Model.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2022/1/4.
//

import UIKit
import HandyJSON

class U17Model: HandyJSON {

    var name: String?
    
    required init() {}
}

struct WeatherCityModel: HandyJSON {
    
    var weatherinfo: WeatherInfoModel?
}

struct WeatherInfoModel: HandyJSON {
    
    var SD: String?
    var WD: String?
    var WS: String?
    var WSE: String?
    var city: String?
    var cityid: String?
    var isRadar: Bool = false
    var radar: String?
    var temp: Int?
    var time: String?
    var weather: String?
    
}
