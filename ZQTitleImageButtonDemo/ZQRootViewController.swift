//
//  ZQRootViewController.swift
//  ZQTitleImageButton
//
//  Created by Darren on 2019/3/20.
//  Copyright © 2019 Darren. All rights reserved.
//

import UIKit
import ZQTitleImageButton

class ZQRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonWidth:CGFloat = 100
        let buttonHeight:CGFloat = 90
        let buttonCountPerRow:CGFloat = 3
        let gap = (UIScreen.main.bounds.size.width - buttonCountPerRow * buttonWidth) / (buttonCountPerRow + 1)
        let titles = [
        "normal",
        "imageLeft",
        "imageRight",
        "imageTop",
        "imageBottom",
        "imageCenterTop",
        "imageCenterBottom",
        "imageCenterUp",
        "imageCenterDown",
        ]
        for i:Int in 0..<titles.count {
            let button = getButton(frame: CGRect(x: gap + (buttonWidth + gap) * (CGFloat(i).truncatingRemainder(dividingBy: buttonCountPerRow)) , y: 100 + (buttonHeight + gap) * CGFloat((i / Int(buttonCountPerRow))), width: buttonWidth, height: buttonHeight), title: titles[i])
            button.setImageTitle(style: ZQButtonImageTitleStyle(rawValue: i) ?? .normal, padding: 5)
            view.addSubview(button)
        }
    }
}

extension ZQRootViewController {
    fileprivate func getButton(frame:CGRect, title:String) -> ZQTitleImageButton {
        let button = ZQTitleImageButton(type: .custom)
        button.backgroundColor = UIColor.brown
        button.frame = frame
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.setImage(UIImage(named: "heart"), for: .normal)
        return button
    }
}

