//
//  ViewController.swift
//  Animation with Timer
//
//  Created by D7703_19 on 2018. 4. 5..
//  Copyright © 2018년 s22dfg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 숫자는 1부터 시작 - 레이블 표시 숫자
    var counter = 1
    
    // 타이머 선언
    var myTimer = Timer()
    
    // 1부터 5까지 가는데 boolean 선언
    var direction = true
    
    // 한 개의 버튼으로 시작 멈춤을 하는데 있어서 필요한 boolean선언
    var button = true
    
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
       // 버튼 한 개로 시작과 멈춤을 실행하기
        if button == true {
            myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
            button = false
        }
        else if button == false {
            myTimer.invalidate()
            button = true
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        // 타이머 종료
        //myTimer.invalidate()
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

