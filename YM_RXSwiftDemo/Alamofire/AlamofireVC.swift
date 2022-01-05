//
//  AlamofireVC.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2021/12/30.
//

import UIKit
import Alamofire

class AlamofireVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
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
