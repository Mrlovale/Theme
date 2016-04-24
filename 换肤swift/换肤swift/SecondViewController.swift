//
//  SecondViewController.swift
//  换肤swift
//
//  Created by 赵大红 on 16/4/1.
//  Copyright © 2016年 赵大红. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var rectImageView: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var showLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        rectImageView.image = UIImage(imageName: "rect")
        heartImageView.image = UIImage(imageName: "heart")
        faceImageView.image = UIImage(imageName: "face")
        showLabel.backgroundColor = UIColor.themeColor()
    }

}
