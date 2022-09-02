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

//        let timer = Observable<Int>.timer(0, period: 2, scheduler: MainScheduler.instance).take(10)
//        timer.subscribe { number in
//            print(number)
//
//        } onCompleted: {
//            print("finished")
//        }.disposed(by: disposableBag)

//        let from = Observable.from(["one", "two", "three"])
//        from.subscribe { text in
//            print(text)
//        } onCompleted: {
//            print("finish")
//        }.disposed(by: disposableBag)

        // merge
//        let subject1 = PublishSubject<String>()
//        let subject2 = PublishSubject<String>()
//
//        Observable.of(subject1, subject2)
//            .merge()
//            .subscribe { next in
//
//                if case let .next(text) = next {
//
//                    print(text)
//                }
//
////                switch next {
////                case .next(let text):
////                    print(text)
////                case .error(let error):
////                    print(error.localizedDescription)
////                case .completed:
////                    print("结束了")
////                }
//            }.disposed(by: disposableBag)
//        subject1.onNext("A")
//        subject1.onNext("B")
//        subject2.onNext("23")
//        subject2.onNext("55")
        
        // zip、combineLatest
//        let first = PublishSubject<String>()
//        let second = PublishSubject<String>()
//
//        Observable.combineLatest(first, second).subscribe { observe in
//            if case let .next((text1, text2)) = observe {
//                print(text1, text2)
//            }
//        }.disposed(by: disposableBag)
//
//        first.onNext("1")
//        second.onNext("A")
//        first.onNext("2")
//        first.onNext("5")
//        second.onNext("B")
        
        // Variable
//        let variable = Variable("111")
//        variable.value = "222"
//        variable.asObservable().subscribe { observer in
//            print("第1次订阅：\(observer)")
//        }.disposed(by: disposableBag)
//
//        variable.value = "333"
//
//        //第2次订阅
//        variable.asObservable().subscribe {
//            print("第2次订阅：", $0)
//        }.disposed(by: disposableBag)
//        variable.value = "444"
        
//        let disposeBag = DisposeBag()
//        let first = BehaviorSubject(value: "👦🏻")
//        let second = BehaviorSubject(value: "🅰️")
//        let variable = Variable(first)
//
//        variable.asObservable()
//                .flatMap { $0 }
//                .subscribe(onNext: { print($0) })
//                .disposed(by: disposeBag)
//
//        first.onNext("🐱")
//        variable.value = second
//        second.onNext("🅱️")
//        first.onNext("🐶")
        
        // share
//        let seq = PublishSubject<Int>()
//        let ob = seq.map { i -> Int in
//            print("map:---\(i)")
//            return i*3
//        }.share(replay: 1, scope: .forever)
//
//        let _ = ob.subscribe { num in
//            print("第一次打印：\(num)")
//        } onError: { error in
//            print(error.localizedDescription)
//        }.disposed(by: disposableBag)
//
//        let _ = ob.subscribe { num in
//            print("第二次打印：\(num)")
//        } onError: { error in
//            print(error.localizedDescription)
//        }.disposed(by: disposableBag)
//
//        seq.onNext(1)
    
        inputTF.rx.text.orEmpty.map { text -> String in
            
            print("走了\(text)")
            return "map:\(text)"
        }.subscribe { ob in
            
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
