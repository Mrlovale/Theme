//
//  ViewController.swift
//  换肤swift
//
//  Created by 赵大红 on 16/4/1.
//  Copyright © 2016年 赵大红. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var RectImageView: UIImageView!

    @IBAction func redSkinAction(sender: AnyObject) {
        SkinTool.setThemeColor(themeCategory.red.rawValue)
        setImage()
    }
    
    @IBAction func orangeSkinAction(sender: AnyObject) {
        SkinTool.setThemeColor(themeCategory.orange.rawValue)
        setImage()
    }
    
    @IBAction func greenSkinAction(sender: AnyObject) {
        SkinTool.setThemeColor(themeCategory.green.rawValue)
        setImage()
    }
    
    @IBAction func bluSkinAction(sender: UIButton) {
        SkinTool.setThemeColor(themeCategory.blue.rawValue)
        setImage()
    }
    
    private func setImage() {
        faceImageView.image = UIImage(imageName: "face")
        heartImageView.image = UIImage(imageName: "heart")
        RectImageView.image = UIImage(imageName: "rect")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(themeCategory.red.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

