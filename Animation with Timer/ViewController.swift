//
//  ViewController.swift
//  Animation with Timer
//
//  Created by D7703_19 on 2018. 4. 5..
//  Copyright © 2018년 s22dfg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    var myTimer = Timer()
    var direction = true
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imageCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 카운터 숫자 표시
        imageCounter.text = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: Any) {
       // 타이머 시간 설정 - 애니메이션
       myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(_ sender: Any) {
        // 타이머 종료
         myTimer.invalidate()
    }
    
    @objc func doAnimation() {
        
        // 1부터 5까지 ~ 5부터 1까지
        if counter == 5 {
            direction = false
        } else if counter == 1 {
            direction = true
        }
        
        if direction == true {
            counter += 1
        } else if direction == false {
            counter = counter - 1
        }
        
        // 1부터 5까지 ~ 다시 1부터 5까지
        
        /*
        if counter == 5 {
            counter = 1
        } else {
            counter = counter + 1
        }
        */
        
        myImageView.image = UIImage(named: "frame\(counter).png")
        imageCounter.text = String(counter)
    }
    

}

