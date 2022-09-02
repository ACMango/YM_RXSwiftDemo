//
//  LottieVC.swift
//  YM_RXSwiftDemo
//
//  Created by YM on 2022/9/2.
//

import UIKit
import Lottie

class LottieVC: UIViewController {
    
    private var aniView = AnimationView(frame: CGRect(x: 0, y: 90, width: 150, height: 150))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        aniView.backgroundColor = .orange
        // Do any additional setup after loading the view.
        let starAnimation = Animation.named("LottieLogo2.json")
        aniView.animation = starAnimation
        aniView.loopMode = .autoReverse
        
        view.addSubview(aniView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        aniView.play { (finished) in
          /// Animation finished
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
