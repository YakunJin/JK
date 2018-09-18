//
//  PhotoCollectionViewController.swift
//  JK
//
//  Created by JK on 2018/9/17.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    var imageList: NSArray! = []
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var imageCount: Int!

    override func viewDidLoad() {
        let plistPath = Bundle.main.path(forResource: "ImageList", ofType: "plist");
        imageList = NSArray.init(contentsOfFile: plistPath! as String);
        
        let screenFrame = UIScreen.main.bounds;
        screenWidth = screenFrame.size.width;
        screenHeight = screenFrame.size.height;
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageCount = imageList.count;
        return imageCount;
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CellIdentifier = "ImageViewCell";
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath);
        let row = (indexPath as NSIndexPath).row;
        let cellDict = imageList[row] as! NSDictionary;
        let imagePath = String(format: "%@.jpeg", cellDict["name"] as! String);
        let uiImageCellView = cell.backgroundView as! UIImageView;
        uiImageCellView.image = originalImageScaleToSize(originImage: UIImage.init(named: imagePath)!, withScaleSize: CGSize(width: 300, height: 300));
        return cell;
    }

    func originalImageScaleToSize(originImage:UIImage, withScaleSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContext(withScaleSize);// 创建一个bitmap的context，并把它设置成为当前正在使用的context
        originImage.draw(in: CGRect(x: 0, y: 0, width: withScaleSize.width, height: withScaleSize.height));// 绘制改变大小的图片，self指的是原图片
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();// 从当前context中创建一个改变大小后的图片
        UIGraphicsEndImageContext();// 使当前的context出堆栈
        return scaledImage as! UIImage;// 返回新的改变大小后的图片
    }
}
