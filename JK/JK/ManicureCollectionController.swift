//
//  Manicure.swift
//  JK
//
//  Created by JKn on 2018/10/29.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
import UIKit

class ManicureCollectionController: PhotoCollectionViewController {
    override func initImagePath() {
        plistPath = Bundle.main.path(forResource: "ManicureList", ofType: "plist") as! String;
    }
    
    override func initFilterOptions(filterTypeView: FilterTypeView) {
        filterTypeView.initSegmentView(segmentOptions: ["全部", "狗", "兔子", "其他"],
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
