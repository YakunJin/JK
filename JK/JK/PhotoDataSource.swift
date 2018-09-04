//
//  PhotoDataSource.swift
//  JK
//
//  Created by JK on 2018/9/4.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    var photos = [Photo]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "ImageViewCell";
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath);
        return cell;
    }
   
}
