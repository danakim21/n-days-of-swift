//
//  ViewController.swift
//  DoitImageView2
//
//  Created by Dayoon Kim on 2020/06/08.
//  Copyright © 2020 Dayoon Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var maxImage = 6
    var numImage = 1
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "1.png")
    }

    @IBAction func btnNextImage(_ sender: UIButton) {
        if numImage == 6 {
            numImage = 1
        } else {
            numImage += 1
        }
        let imageName = "\(numImage).png"
        imgView.image = UIImage(named: imageName)
    }
    
    @IBAction func btnPrevImage(_ sender: UIButton) {
        if numImage == 1 {
            numImage = 6
        } else {
            numImage -= 1
        }
        let imageName = "\(numImage).png"
        imgView.image = UIImage(named: imageName)
    }
}

