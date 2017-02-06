//
//  ButtonChange.swift
//  SwiftExtensions
//
//  Created by mac on 2017/2/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ButtonChange: UIButton {

    init(title: String, normalImage: UIImage, selectImage: UIImage) {
        super.init(frame: CGRect())
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        setTitle(title + " ", for: .normal)
        setTitleColor(UIColor.darkGray, for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        
        setImage(normalImage, for: .normal)
        setImage(selectImage, for: .normal)
        
        sizeToFit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let titleLabel = titleLabel,
            let imageView = imageView
            else {
                return
        }
        
        titleLabel.frame = titleLabel.frame.offsetBy(dx: -imageView.bounds.size.width, dy: 0)
        imageView.frame = imageView.frame.offsetBy(dx: titleLabel.bounds.size.width, dy: 0)
    }


}
