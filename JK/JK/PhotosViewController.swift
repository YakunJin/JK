//
//  PhotosViewController.swift
//  JK
//
//  Created by JK on 2018/9/4.
//  Copyright © 2018 JK. All rights reserved.
//

import "ImageCollectionViewController.h"

ImageCollectionViewController
class PhotosViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        
    }
}

