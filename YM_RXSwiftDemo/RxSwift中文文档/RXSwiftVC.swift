//
//  RXSwiftVC.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2022/1/17.
//

import UIKit
import RxSwift
import RxCocoa

class RXSwiftVC: UIViewController {

    var disposableBag = DisposeBag()
    
    private lazy var inputTF: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    private lazy var outputTF: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(inputTF)
        view.addSubview(outputTF)
        inputTF.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        
        outputTF.snp.makeConstraints { make in
            make.centerX.width.height.equalTo(self.inputTF)
            make.top.equalTo(self.inputTF.snp.bottom).offset(25)
        }
        
//        let numbers: Observable<Int> = Observable.create { observer in
//
//            observer.onNext(0)
//            observer.onNext(1)
//            observer.onNext(2)
//            observer.onNext(3)
//            observer.onNext(4)
//            observer.onNext(5)
//            observer.onCompleted()
//
//            return Disposables.create()
//        }
//
//        numbers.subscribe { returnNumber in
//            print(returnNumber)
//        }.disposed(by: disposableBag)
        
//        let single = Single<String>.create { singleObserver in
//
//            singleObserver(.success("牛呀牛"))
//
//            return Disposables.create()
//        }
//        single.subscribe { text in
//            print(text)
//        } onError: { error in
//            print(error.localizedDescription)
//        }.disposed(by: disposableBag)

        // Driver
//        let results = inputTF.rx.text.throttle(2, scheduler: MainScheduler.instance)
//        results.map { "\($0?.count ?? 0)" }.bindTo(outputTF.rx.text).disposed(by: disposableBag)

        
        // Operations
//        let just = Observable.just(100)
//        just.subscribe { number in
//            print(number)
//        }.disposed(by: disposableBag)

        let timer = Observable<Int>.timer(0, period: 2, scheduler: MainScheduler.instance).take(10)
        timer.subscribe { number in
            print(number)
            
        } onCompleted: {
            print("finished")
        }.disposed(by: disposableBag)

        
//        let from = Observable.from(["one", "two", "three"])
//        from.subscribe { text in
//            print(text)
//        } onCompleted: {
//            print("finish")
//        }.disposed(by: disposableBag)

        
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
