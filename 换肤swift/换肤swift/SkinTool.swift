//
//  SkinTool.swift
//  换肤swift
//
//  Created by 赵大红 on 16/4/1.
//  Copyright © 2016年 赵大红. All rights reserved.
//

import UIKit

let kThemeChangeNotification = "kThemeChangeNotification"
let skinColor = "skinColor"
private var _themeColor: String?
private var _themeShowColor: UIColor?

enum themeCategory: String {
    case red
    case orange
    case green
    case blue
}

class SkinTool {
    /// 设置主题的颜色
    class func setThemeColor(themeColor: String) {
        _themeColor = themeColor
        
        NSUserDefaults.standardUserDefaults().setObject(themeColor, forKey: skinColor)
        _themeShowColor = nil
        _themeShowColor = UIColor.themeColor()
        
        // 发送主题切换的通知
        NSNotificationCenter.defaultCenter().postNotificationName(kThemeChangeNotification, object: nil)
    }
    
    // 获取主题文件夹 skin/blue
    class func themePath() -> String {
        var mainPath = (NSBundle.mainBundle().bundlePath as NSString).stringByAppendingPathComponent("skin")
        if let theme = (NSUserDefaults.standardUserDefaults().objectForKey(skinColor) as? String){
            mainPath = (mainPath as NSString).stringByAppendingPathComponent(theme)
        } else {
            // 默认为blue主题
            mainPath = (mainPath as NSString).stringByAppendingPathComponent("blue")
        }
        return mainPath
    }
    
    // 获取主题文件夹下的plist skin/blue/bgColor.plist
    class func themeColorPath() -> String {
        let themePath = self.themePath()
        return (themePath as NSString).stringByAppendingPathComponent("bgColor.plist")
    }
    
}

extension UIImage {
    // 得到主题文件夹下面的图片
    convenience init?(imageName: String) {
        let fullImagePath = (SkinTool.themePath() as NSString).stringByAppendingPathComponent(imageName)
        self.init(contentsOfFile: fullImagePath)
    }
}

extension UIColor {
    // 得到主题的颜色
    class func themeColor() -> UIColor {
        if (_themeShowColor == nil) {
            let dic = NSDictionary(contentsOfFile: SkinTool.themeColorPath())
            let colorStr = dic!["labelBgColor"] as! String
            let rgbs = colorStr.componentsSeparatedByString(",")
            let r = Int(rgbs[0] as String)
            let g = Int(rgbs[1] as String)
            let b = Int(rgbs[2] as String)
            
            return UIColor(red: CGFloat(r!), green: CGFloat(g!), blue: CGFloat(b!), alpha: 1.0)
        } else {
            return _themeShowColor!
        }
        
    }
    
}


