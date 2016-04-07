//
//  Config.swift
//  SwiftRefresh
//
//  Created by 赵晓东 on 16/3/22.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import Foundation
import UIKit

let WIDTH = UIScreen .mainScreen().bounds.size.width //屏幕宽度
let HEIGHT = UIScreen .mainScreen().bounds.size.height //屏幕高度

//自定义颜色
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> (UIColor) {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

//版本
func IS_IOS7() -> Bool {
    return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0
}

func IS_IOS8() -> Bool {
    return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0
}



//创建View
func createView (frame:CGRect) -> (UIView) {
    let view = UIView(frame: frame)
    return view;
}

//创建Label
func createLabel (frame:CGRect, Font:CGFloat, Text:String) -> (UILabel) {
    let label = UILabel(frame: frame)
    label.text = Text
    label.font = UIFont.systemFontOfSize(Font)
    return label
}

//创建button
func createButton (frame:CGRect, Text:String, ImageName:String, bgImageName:String, Target:AnyObject, Method:Selector) -> (UIButton) {
    let button = UIButton(type:.Custom)
    button.frame = frame
    button.setTitle(Text, forState: UIControlState.Normal)
    if ImageName.isEmpty {
        button.setImage(UIImage(named:ImageName), forState: UIControlState.Normal)
    }
    if bgImageName.isEmpty {
        button.setBackgroundImage(UIImage(named:bgImageName), forState: UIControlState.Normal)
    }
    button.addTarget(Target, action: Method, forControlEvents:UIControlEvents.TouchUpInside)
    return button
}


//创建imageView
func createImageView (frame:CGRect, ImageName:String) -> (UIImageView) {
    let imageView = UIImageView(frame: frame)
    imageView.image = UIImage(named:ImageName)
    imageView.userInteractionEnabled = true
    return imageView
}


//创建UITextField
func createTextField (frame:CGRect, placeholder:String, passWord:Bool, Font:CGFloat) -> (UITextField) {
    let textField = UITextField(frame: frame)
    //灰色提示框
    textField.placeholder = placeholder
    //文字对齐方式
    textField.textAlignment = NSTextAlignment.Left
    //是否加密
    textField.secureTextEntry = passWord
    //边框
    textField.borderStyle = UITextBorderStyle.RoundedRect
    //键盘类型
    textField.keyboardType = UIKeyboardType.EmailAddress
    //关闭首字母大写
    
    //清除按钮
    
    //        //左图片
    //        if leftImageView.isKindOfClass(UIImageView) {
    //            textField.leftView = leftImageView
    //            textField.leftViewMode = UITextFieldViewMode.Always
    //        }
    //        //右图片
    //        if rightImageView.isKindOfClass(UIImageView) {
    //            textField.rightView = rightImageView
    //            //编辑状态下一直存在
    //            textField.rightViewMode = UITextFieldViewMode.WhileEditing
    //        }
    //字体
    textField.font = UIFont.systemFontOfSize(Font)
    
    return textField
}

/*
App Key
z3v5yqkbvtbx0
*/

/*
token:
Z1icrP+83OFfvscTPz//xbDvla3Nyi7xzQkBJirEA38gjFBmVTLXOKKy9OmSmImijO3D+UmUxhGRuwa/fVQ9UQ==
*/
