//
//  AlamofireVC.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2021/12/30.
//

import UIKit
import Alamofire
import HandyJSON
import Moya

class AlamofireVC: UIViewController {
    
    private lazy var textL: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        configUI()
        
        let urlStr = "http://app.u17.com/v3/appV3_3/ios/phone/comic/boutiqueListNew"
        // 1：方法一
//        AF.request(urlStr, method: .get, parameters: ["sexType": "0"], encoding: URLEncoding.default, headers: nil).response { response in
//
//            if response.error == nil {
//                print("请求成功", String(data: response.data!, encoding: .utf8)!)
//            } else {
//                print("请求失败")
//            }
//        }
        // 方法2：
//        AF.request(urlStr, method: .get, parameters: ["sexType": "0"], encoding: URLEncoding.default, headers: nil).responseDecodable { (response: DataResponse<String, AFError>) in
//            if let data = response.data {
//                print(String(data: data, encoding: .utf8)!)
//            }
//        }
        
        
        // 3：获取天气接口
//        let weatherUrl: String = "http://weatherapi.market.xiaomi.com/wtr-v2/temp/realtime"
//        let para = ["cityId": "101040100"]
//        AF.request(weatherUrl, method: .get, parameters: para).responseJSON { response in
//            switch response.result {
//
//                case .success(let json):
//                    let jsonDic = json as? NSDictionary
//                    print(jsonDic)
//
//                case .failure(let error):
//                    print(error)
//            }
//        }
        
        // 4：通过Moya来获取数据
        ApiProvider.request(.weatherCity(cityId: "101040100")) {[weak self] result in
            if case .success(let response) = result {
            
                // 解析数据
//                let jsonDic = try! response.mapJSON() as! NSDictionary
//                print(jsonDic)
                
                let jsonString = String(data: response.data, encoding: .utf8)
                guard let model = JSONDeserializer<WeatherInfoModel>.deserializeFrom(json: jsonString, designatedPath: "weatherinfo" ) else {
                    return
//                    throw MoyaError.jsonMapping(self)
                }
                
//                self?.textL.text = "地区：\(model.weatherinfo?.radar ?? "") \n时间：\(model.weatherinfo?.time ?? "") \n风向：\(model.weatherinfo?.WD ?? "")\(model.weatherinfo?.WS ?? "") \n湿度：\(model.weatherinfo?.SD ?? "")"
                
                self?.textL.text = "地区：\(model.radar ?? "") \n时间：\(model.time ?? "") \n风向：\(model.WD ?? "")\(model.WS ?? "") \n湿度：\(model.SD ?? "")"
                
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AlamofireVC {
    
    private func configUI() {
        
        view.addSubview(textL)
        
        textL.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.center.equalToSuperview()
        }
    }
    

}
