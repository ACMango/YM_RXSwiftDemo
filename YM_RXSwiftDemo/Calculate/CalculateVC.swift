//
//  CalculateVC.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2022/1/5.
//

import UIKit

class CalculateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
}

// MARK: - 计算方法
extension CalculateVC {
    
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
