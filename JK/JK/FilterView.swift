//
//  FilterView.swift
//  JK
//
//  Created by YakunJin on 2018/10/20.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
import UIKit
import YNDropDownMenu
import SMSegmentView

protocol ImageServiceDelegate {
    func applyFilter(filters: Array<Int>!)
}

class ImageService {
    public static let imageServiceInstance = ImageService();
    
    var filterList: Array<Int> = Array()
    var delegate: ImageServiceDelegate?

    func applyFilter(){
        delegate?.applyFilter(filters: filterList);
    }
    
}

enum FilterType: String {
    case None
    case Japan
    case Europe
    case Chinese
}

class FilterTypeView: YNDropDownView {
    var segmentView: SMSegmentView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    
    @IBAction func confirmButtonClicked(_ sender: Any) {
//        self.changeMenu(title: builtDateSegmentControl.titleForSegment(at: builtDateSegmentControl.selectedSegmentIndex)!, at: 0)
        ImageService.imageServiceInstance.filterList = Array<Int>()
        ImageService.imageServiceInstance.filterList.append(segmentView.selectedSegmentIndex)
        ImageService.imageServiceInstance.applyFilter()
        
        self.hideMenu()
        
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.hideMenu()
        
    }
    func initViews() {
        let appearance = SMSegmentAppearance()
        appearance.segmentOnSelectionColour = UIColor.lightGray
        appearance.segmentOffSelectionColour = UIColor.darkGray
        appearance.titleOnSelectionColour = UIColor.white
        appearance.titleOffSelectionColour = UIColor.white
        appearance.titleOnSelectionFont = UIFont.systemFont(ofSize: 12.0)
        appearance.titleOffSelectionFont = UIFont.systemFont(ofSize: 12.0)
        appearance.contentVerticalMargin = 10.0
        
        segmentView = SMSegmentView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width/3, height: self.frame.size.height-50), dividerColour: UIColor(white: 0.95, alpha: 0.3), dividerWidth: 1.0, segmentAppearance: appearance)
//        segmentView.addSegmentWithTitle("全部", onSelectionImage: UIImage(named: "target_light"), offSelectionImage: UIImage(named: "target"))
//        segmentView.addSegmentWithTitle("风格1", onSelectionImage: UIImage(named: "target_light"), offSelectionImage: UIImage(named: "target"))
//        segmentView.addSegmentWithTitle("风格2", onSelectionImage: UIImage(named: "handbag_light"), offSelectionImage: UIImage(named: "handbag"))
//        segmentView.addSegmentWithTitle("风格3", onSelectionImage: UIImage(named: "globe_light"), offSelectionImage: UIImage(named: "globe"))
        segmentView.organiseMode = .vertical
        self.addSubview(segmentView)
    }
    
    func initSegmentView(segmentOptions:[String], segmentSelectionImages: [String]) {
        for i in 0 ..< segmentOptions.count {
            segmentView.addSegmentWithTitle(segmentOptions[i],
                                            onSelectionImage: UIImage(named: segmentSelectionImages[i]),
                                            offSelectionImage: UIImage(named: segmentSelectionImages[i]))
        }
    }
    
//    func getFilterName(index: Int) -> String {
//        switch index{
//        case 0: return FilterType.None.rawValue
//        case 1: return FilterType.Japan.rawValue
//        case 2: return FilterType.Europe.rawValue
//        case 3: return FilterType.Chinese.rawValue
//        default:
//            return FilterType.None.rawValue
//        }
//
//    }
}

