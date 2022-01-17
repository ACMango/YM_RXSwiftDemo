//
//  ViewController.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2021/12/27.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

let YM_ScreenWidth = UIScreen.main.bounds.size.width
let YM_ScreenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController {
    
    enum HomeViewControllerNameType: String {
        case YMLonginVC
        case AlamofireVC
        case CalculateVC
        case RXSwiftVC
    }
    
    private let kCellID = "ViewController"
    
    private lazy var tableview: UITableView = {
        let tb = UITableView.init(frame: CGRect(x: 0, y: 0, width: YM_ScreenWidth, height: 80))
        tb.delegate = self
        tb.dataSource = self
        tb.rowHeight = 50
        return tb
    }()
    
    // 外界可读属性
    private (set) var dataArray: [HomeViewControllerNameType] = [.YMLonginVC, .AlamofireVC, .CalculateVC, .RXSwiftVC]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        
        configUI()
    }
    
    // MARK: - UI Config
    private func configUI() {
        
        view.addSubview(tableview)
        
        //
        tableview.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

}

// MARK: - 创建和接收信号
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableview.dequeueReusableCell(withIdentifier: kCellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: kCellID)
        }
        // 设置cell数据
        cell?.textLabel?.text = dataArray[indexPath.row].rawValue
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        
        let nextVCType = dataArray[indexPath.row]
        
        var nextVC: UIViewController? = nil
        switch nextVCType {
            
            case .YMLonginVC: // 登录页面
                nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "YMLonginVC")
            case .AlamofireVC: // Alamofire
                nextVC = AlamofireVC()
            case .CalculateVC: // CalculateVC
                 nextVC = CalculateVC()
            case .RXSwiftVC:
                nextVC = RXSwiftVC()
        }
        
        guard let real_nextVC = nextVC else { return }
        navigationController?.pushViewController(real_nextVC, animated: true)
    }
    

}

