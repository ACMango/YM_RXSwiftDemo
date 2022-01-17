//
//  CalculateVC.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2022/1/5.
//

import UIKit
import RxSwift

class CalculateVC: UIViewController {
    
    var disposebag = DisposeBag()
    
    private lazy var baseMoneyTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "起始资金"
        textfield.keyboardType = .decimalPad
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private lazy var yearNumTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "投资多少年"
        textfield.keyboardType = .decimalPad
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private lazy var everyYearAddMoneyTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "每年追加多钱"
        textfield.keyboardType = .decimalPad
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private lazy var everyYearAddRatio: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "每年平均收益率"
        textfield.keyboardType = .decimalPad
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private lazy var confirmBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("确认", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(baseMoneyTF)
        view.addSubview(yearNumTF)
        view.addSubview(everyYearAddMoneyTF)
        view.addSubview(everyYearAddRatio)
        view.addSubview(confirmBtn)
        
        let textfieldHeight: CGFloat = 50.0
        let textfieldWidth: CGFloat = 150.0
        baseMoneyTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.height.equalTo(textfieldHeight)
            make.width.equalTo(textfieldWidth)
            make.top.equalToSuperview().offset(100)
        }
        
        yearNumTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.height.equalTo(textfieldHeight)
            make.width.equalTo(textfieldWidth)
            make.top.equalTo(baseMoneyTF.snp.bottom).offset(30)
        }
        
        everyYearAddMoneyTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.height.equalTo(textfieldHeight)
            make.width.equalTo(textfieldWidth)
            make.top.equalTo(yearNumTF.snp.bottom).offset(30)
        }
        
        everyYearAddRatio.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.height.equalTo(textfieldHeight)
            make.width.equalTo(textfieldWidth)
            make.top.equalTo(everyYearAddMoneyTF.snp.bottom).offset(30)
        }
        
        confirmBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.height.equalTo(textfieldHeight)
            make.width.equalTo(textfieldWidth)
            make.top.equalTo(everyYearAddRatio.snp.bottom).offset(30)
        }
        
        confirmBtn.rx.tap.subscribe {[weak self] onnext in
            
            let baseMoney = Double(self?.baseMoneyTF.text ?? "0.00")!
            let yearNum = Int(self?.yearNumTF.text ?? "0")!
            let everyAddMoney = Double(self?.everyYearAddMoneyTF.text ?? "0.00")!
            let everyRatio = Double(self?.everyYearAddRatio.text ?? "0.00")!
            self?.totalGetWithBaseMoney(baseMoney, yearNum: yearNum, everyYearAddMoney: everyAddMoney, everyYearAddRatio: everyRatio)
            
        }.disposed(by: disposebag)


        
//        calculate(number: 10)
    }
}

// MARK: - 计算方法
extension CalculateVC {
    
    private func totalGetWithBaseMoney(_ baseMoney: Double, yearNum: Int, everyYearAddMoney: Double, everyYearAddRatio: Double) {
        
        var totalDouble: Double = 0
        totalDouble += baseMoney
        for i in 1...yearNum {
            totalDouble += everyYearAddMoney
            totalDouble *= everyYearAddRatio
            print("第\(i)年 有\(String(format: "%.2f", totalDouble))")
        }
    }
    
    private func calculate(number: Int) {

        let baseEveryMoney: Double = 50000
        let baseRatioDouble: Double = 1.07
        var totalDouble: Double = 0
        for i in 1...number {

            totalDouble += baseEveryMoney
            totalDouble *= baseRatioDouble
            print("第\(i)年 有\(String(format: "%.2f", totalDouble))")
        }

        print(totalDouble)
    }
}
