//
//  ZQTitleImageButton.swift
//  ZQTitleImageButtonDemo
//
//  Created by Darren on 2019/3/20.
//  Copyright © 2019 Darren. All rights reserved.
//

import UIKit

// MARK: 按钮图片标题类型
public enum ZQButtonImageTitleStyle:Int {
    case normal                 = 0     ///< 图片在左, 文字在右, 整体居中
    case imageLeft              = 1     ///< 图片在左, 文字在右, 整体居中
    case imageRight             = 2     ///< 图片在右, 文字在左, 整体居中
    case imageTop               = 3     ///< 图片在上, 文字在下, 整体居中
    case imageBottom            = 4     ///< 图片在下, 文字在上, 整体居中
    case imageCenterTop         = 5     ///< 图片居中, 文字在上距离按钮顶部
    case imageCenterBottom      = 6     ///< 图片居中，文字在下距离按钮底部
    case imageCenterUp          = 7     ///< 图片居中，文字在图片上面
    case imageCenterDown        = 8     ///< 图片居中，文字在图片下面
}


public class ZQTitleImageButton: UIButton {
    
    /// 设置图片标题类型和间隙 注: 需先设置title和image后调用才有效
    public func setImageTitle(style:ZQButtonImageTitleStyle, padding:CGFloat) -> Void {
        titleEdgeInsets = UIEdgeInsets.zero
        imageEdgeInsets = UIEdgeInsets.zero
        guard let imageRect = imageView?.frame, let titleRect = titleLabel?.frame else {
            return
        }
        let selfHeight:CGFloat = frame.size.height
        let selfWidth:CGFloat = frame.size.width
        let paddingHalf:CGFloat = padding / 2
        
        let imageWidth:CGFloat = imageRect.size.width
        let imageHeight:CGFloat = imageRect.size.height
        let imageX:CGFloat = imageRect.origin.x
        let imageY:CGFloat = imageRect.origin.y
        
        let titleWidth:CGFloat = titleRect.size.width
        let titleHeight:CGFloat = titleRect.size.height
        let titleX:CGFloat = titleRect.origin.x
        let titleY:CGFloat = titleRect.origin.y
        
        let totalHeight:CGFloat = imageHeight + padding + titleHeight
        
        switch style {
        case .normal:
            titleEdgeInsets = UIEdgeInsets.zero
            imageEdgeInsets = UIEdgeInsets.zero
            
        case .imageLeft:
            titleEdgeInsets = UIEdgeInsets(top: 0,
                                           left: paddingHalf,
                                           bottom: 0,
                                           right: -paddingHalf)
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: -paddingHalf,
                                           bottom: 0,
                                           right: paddingHalf)
            
        case .imageRight:
            titleEdgeInsets = UIEdgeInsets(top: 0,
                                           left: -(imageWidth + paddingHalf),
                                           bottom: 0,
                                           right: (imageWidth + paddingHalf))
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: titleWidth + paddingHalf,
                                           bottom: 0,
                                           right: -(titleWidth + paddingHalf))
            
        case .imageTop:
            titleEdgeInsets = UIEdgeInsets(top: ((selfHeight - totalHeight) / 2 + imageHeight + padding - titleY),
                                           left: (selfWidth / 2 - titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2,
                                           bottom: -((selfHeight - totalHeight) / 2 + imageHeight + padding - titleY),
                                           right: -(selfWidth / 2 - titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2)
            imageEdgeInsets = UIEdgeInsets(top: ((selfHeight - totalHeight) / 2 - imageY),
                                           left: (selfWidth / 2 - imageX - imageWidth / 2),
                                           bottom: -((selfHeight - totalHeight) / 2 - imageY),
                                           right: -(selfWidth / 2 - imageX - imageWidth / 2))
            
        case .imageBottom:
            titleEdgeInsets = UIEdgeInsets(top: ((selfHeight - totalHeight) / 2 - titleY),
                                           left: (selfWidth / 2 - titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2,
                                           bottom: -((selfHeight - totalHeight) / 2 - titleY),
                                           right: -(selfWidth / 2 - titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2)
            imageEdgeInsets = UIEdgeInsets(top: ((selfHeight - totalHeight) / 2 + titleHeight + padding - imageY),
                                           left: (selfWidth / 2 - imageX - imageWidth / 2),
                                           bottom: -((selfHeight - totalHeight) / 2 + titleHeight + padding - imageY),
                                           right: -(selfWidth / 2 - imageX - imageWidth / 2))
            
        case .imageCenterTop:
            titleEdgeInsets = UIEdgeInsets(top: -(titleY - padding),
                                           left: (selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2,
                                           bottom: (titleY - padding),
                                           right: -(selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2)
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: (selfWidth / 2 - imageX - imageWidth / 2),
                                           bottom: 0,
                                           right: -(selfWidth / 2 - imageX - imageWidth / 2))
            
        case .imageCenterBottom:
            titleEdgeInsets = UIEdgeInsets(top: (selfHeight - padding - titleY - titleHeight),
                                           left: (selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2,
                                           bottom: -(selfHeight - padding - titleY - titleHeight),
                                           right: -(selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2)
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: (selfWidth / 2 - imageX - imageWidth / 2),
                                           bottom: 0,
                                           right: -(selfWidth / 2 - imageX - imageWidth / 2))
            
        case .imageCenterUp:
            titleEdgeInsets = UIEdgeInsets(top: -(titleY + titleHeight - imageY + padding),
                                           left: (selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2,
                                           bottom: (titleY + titleHeight - imageY + padding),
                                           right: -(selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2)
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: (selfWidth / 2 - imageX - imageWidth / 2),
                                           bottom: 0,
                                           right: -(selfWidth / 2 - imageX - imageWidth / 2))
            
        case .imageCenterDown:
            titleEdgeInsets = UIEdgeInsets(top: (imageY + imageHeight - titleY + padding),
                                           left: (selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2,
                                           bottom: -(imageY + imageHeight - titleY + padding),
                                           right: -(selfWidth / 2 -  titleX - titleWidth / 2) - (selfWidth - titleWidth) / 2)
            imageEdgeInsets = UIEdgeInsets(top: 0,
                                           left: (selfWidth / 2 - imageX - imageWidth / 2),
                                           bottom: 0,
                                           right: -(selfWidth / 2 - imageX - imageWidth / 2))
        }
    }
}
