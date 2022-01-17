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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
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
        
        let single = Single<String>.create { singleObserver in
            
            singleObserver(.success("牛呀牛"))
            
            return Disposables.create()
        }
        single.subscribe { text in
            print(text)
        } onError: { error in
            print(error.localizedDescription)
        }.disposed(by: disposableBag)


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
