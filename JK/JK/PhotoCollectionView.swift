//
//  PhotoCollectionView.swift
//  JK
//
//  Created by JK on 2018/11/13.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionView: UIImageView {
    init(frame: CGRect, with labelText: String,photoImage: UIImage, frameImage: UIImage) {
        super.init(frame: frame)
        let photoView = UIImageView(frame: CGRect(x: 6, y: 6, width: frame.size.width-12, height: frame.size.height-12))
        photoView.image = photoImage
        self.addSubview(photoView);
        self.bringSubviewToFront(photoView)
        self.backgroundColor = UIColor.lightGray
        self.image = frameImage
        var label = UILabel(frame: CGRect(x: 10, y: frame.size.height-35, width: frame.size.width, height: 30))
        label.textColor = UIColor.white
        label.text = labelText
        label.backgroundColor = UIColor.clear
        self.addSubview(label)
        self.bringSubviewToFront(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
