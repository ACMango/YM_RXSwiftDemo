//
//  YMLonginVC.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2021/12/27.
//

import UIKit
import RxSwift

class YMLonginVC: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var usernameWarningL: UILabel!
    @IBOutlet weak var passwordWarningL: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    deinit {
        
        print("YMLonginVC销毁了")
    }
    
    private func configUI() {
        
        /*
         要求：
         当用户输入用户名时，如果用户名不足 5 个字就给出红色提示语，并且无法输入密码，当用户名符合要求时才可以输入密码。
         同样的当用户输入的密码不到 5 个字时也给出红色提示语。
         当用户名和密码有一个不符合要求时底部的绿色按钮不可点击，只有当用户名和密码同时有效时按钮才可点击。
         当点击绿色按钮后弹出一个提示框，这个提示框只是用来做演示而已。
         */
        let usernameMinNumber = 5
        let passwordMinNumber = 5
        
        usernameWarningL.text = "用户名至少\(usernameMinNumber)位"
        passwordWarningL.text = "密码至少\(passwordMinNumber)位"
        
        let userNameValid = usernameTF.rx.text.orEmpty.map { $0.count >= usernameMinNumber }
        userNameValid.bind(to: usernameWarningL.rx.isHidden).disposed(by: disposeBag)
        userNameValid.bind(to: passwordTF.rx.isEnabled).disposed(by: disposeBag)
        
        let passwordValid = passwordTF.rx.text.orEmpty.map { $0.count >= passwordMinNumber
        }
        passwordValid.bind(to: passwordWarningL.rx.isHidden).disposed(by: disposeBag)
        
        let everythingValid = Observable.combineLatest(userNameValid, passwordValid) { $0 && $1}
        everythingValid.bind(to: loginBtn.rx.isEnabled).disposed(by: disposeBag)
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
