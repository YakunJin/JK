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
        let photoView = UIImageView(frame: CGRect(x: 20, y: 55, width: frame.size.width-40, height: frame.size.height-110))
        photoView.image = photoImage
        self.addSubview(photoView);
        self.bringSubviewToFront(photoView)
        self.backgroundColor = UIColor.white
        
//         self.image = frameImage
        let frameView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        frameView.image = frameImage
        self.addSubview(frameView)
        self.bringSubviewToFront(frameView)
        
        var label = UILabel(frame: CGRect(x: 50, y: frame.size.height-90, width: frame.size.width-60, height: 30))
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
