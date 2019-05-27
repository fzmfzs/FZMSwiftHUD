//
//  SwiftHUD.swift
//  SwiftHUD
//
//  Created by fzmfzs on 2019/5/24.
//  Copyright © 2019 fzmfzs. All rights reserved.
//

import MBProgressHUD
///public 模块间访问权限 不能被继承和重写 static修复方法不能被继承重写 静态区分布 app杀死才销毁
//struct  enum 默认用static修饰属性 方法 class用class修饰
//struct、class、enum均可扩展和遵守协议，但是需注意在声明协议的时候我们需要用class修饰其作用域 可继承重新
public struct SwiftHUD {
    public static func show(message:String?,
              duration:TimeInterval = 3,
              textColor:UIColor = .white,
              bezelAlpha:CGFloat = 0.6,
              addedTo view:UIView? = UIApplication.shared.keyWindow) {
        guard let sorceView = view else {return}
        let hud = MBProgressHUD.showAdded(to: sorceView, animated: true)
        hud.isUserInteractionEnabled = false
        hud.mode = .text
        hud.label.font = .systemFont(ofSize: 14)
        hud.label.textColor = textColor
        hud.label.text = message
        hud.margin = 8
        hud.hide(animated: true, afterDelay: duration)
    }
    
    @discardableResult//可忽略返回值
    public static func showAnimated(addedTo view:UIView? = UIApplication.shared.keyWindow,
                      contentColor:UIColor = UIColor(white: 1, alpha: 0.7),
                      bezelColor:UIColor = UIColor.black.withAlphaComponent(0.4),
                      backgroundStyle:MBProgressHUDBackgroundStyle = .solidColor,
                      backgroundColor:UIColor = UIColor(white: 1, alpha: 0.1)
                      ) -> MBProgressHUD? {
        guard let sorceView = view else {return nil}
        let hud = MBProgressHUD.showAdded(to: sorceView, animated: true)
        hud.contentColor = contentColor
        hud.bezelView.backgroundColor = bezelColor
        hud.backgroundView.style = backgroundStyle
        hud.backgroundView.color = backgroundColor
        return hud
    }
    
    public static func hidAnimated(for view:UIView? = UIApplication.shared.keyWindow) {
        guard let sorceview = view else {
            return
        }
        MBProgressHUD.hide(for: sorceview, animated: true)
    }
}
