//
//  PhotoDetailViewController.swift
//  JK
//
//  Created by JK on 2018/9/18.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageDesc: UILabel!
    override func viewDidLoad() {
        let singleTap = UITapGestureRecognizer(target:self, action:#selector(PhotoDetailViewController.tapDetected));
        imageView.isUserInteractionEnabled = true;
        imageView.addGestureRecognizer(singleTap);
    }
    
    @objc func tapDetected(){
        self.dismiss(animated: true, completion: nil);
    }
}
