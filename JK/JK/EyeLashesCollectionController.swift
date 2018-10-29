//
//  EyeLashesCollectionController.swift
//  JK
//
//  Created by JK on 2018/10/29.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
import UIKit

class EyelashesCollectionController: PhotoCollectionViewController {
    override func initImagePath() {
        plistPath = Bundle.main.path(forResource: "EyelashesList", ofType: "plist") as! String;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ImageService.imageServiceInstance.delegate = self
    }
}
