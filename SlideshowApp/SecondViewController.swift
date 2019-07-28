//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by Takemichi on 2019/07/27.
//  Copyright © 2019 takemichi.niro. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var expandedImage: UIImageView!
    
    var selectedimage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       expandedImage.image = selectedimage
    
        
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
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
