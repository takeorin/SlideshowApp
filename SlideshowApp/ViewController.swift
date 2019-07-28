//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Takemichi on 2019/07/26.
//  Copyright © 2019 takemichi.niro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageNo: Int = 0
    var timer: Timer!
    
    @IBOutlet weak var slideView: UIImageView!
    @IBOutlet weak var startstop: UIButton!
    @IBOutlet weak var proceedbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    
    //画像の配列
    var imageArray:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 1...3 {
            imageArray.append(UIImage(named: "\(i).jpg")!)
        }
        //初期画像表示
        slideView.image = imageArray[imageNo]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "result" {
            
            let nextView = segue.destination as! SecondViewController
            
           nextView.selectedimage = slideView.image
    
        }
    }
    
    @IBAction func tapImage(_ sender: UITapGestureRecognizer) {
        
        if timer != nil {
            timer.invalidate()
        }
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    @IBAction func proceed(_ sender: UIButton) {
        if imageNo == 0 || imageNo == 1 {
            imageNo += 1
            slideView.image = imageArray[imageNo]
        } else {
            imageNo = 0
            slideView.image = imageArray[imageNo]
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        if imageNo == 1 || imageNo == 2 {
            imageNo -= 1
            slideView.image = imageArray[imageNo]
        } else {
            imageNo = 2
            slideView.image = imageArray[imageNo]
        }
    }
    
    @IBAction func start(_ sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            startstop.setTitle("停止", for: .normal)
            
            proceedbutton.isEnabled = false
            backbutton.isEnabled = false
            
        } else {
            timer.invalidate()
            timer = nil
            startstop.setTitle("再生", for: .normal)
            
            proceedbutton.isEnabled = true
            backbutton.isEnabled = true
            
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if imageNo == 0 || imageNo == 1 {
            imageNo += 1
            slideView.image = imageArray[imageNo]
        } else {
            imageNo = 0
            slideView.image = imageArray[imageNo]
        }
    }
}
