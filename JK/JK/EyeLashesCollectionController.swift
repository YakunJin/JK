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
    
    override func initFilterOptions(filterTypeView: FilterTypeView) {
        filterTypeView.initSegmentView(segmentOptions: ["全部", "Omega", "Patek Philippe", "IWC"],
                                   segmentSelectionImages: ["target_light", "target_light", "handbag_light", "globe_light"])
    }
    
    override func getFilterName(index: Int) -> String {
        switch index{
        case 0: return FilterType.None.rawValue
        case 1: return FilterType.Japan.rawValue
        case 2: return FilterType.Europe.rawValue
        case 3: return FilterType.Chinese.rawValue
        default:
            return FilterType.None.rawValue
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ImageService.imageServiceInstance.delegate = self
    }
    
    
}
