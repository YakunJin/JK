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

protocol ImageServiceDelegate {
    func applyFilter(filters: Array<String>!)
}

class ImageService {
    public static let imageServiceInstance = ImageService();
    
    var filterList: Array<String> = Array()
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

class FilterStyleView: YNDropDownView {
    @IBOutlet var tradeTypeSegmentControl: UISegmentedControl!
    
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
        self.normalSelected(at: 1)
        self.hideMenu()
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
//                self.changeMenu(title: "Changed", at: 1)
        //        self.changeMenu(title: "Changed", status: .selected, at: 0)
        self.alwaysSelected(at: 1)
        //        self.alwaysSelected(at: 2)
        //        self.alwaysSelected(at: 3)
        self.hideMenu()
        
    }
    
    override func dropDownViewOpened() {
        print("dropDownViewOpened")
    }
    
    override func dropDownViewClosed() {
        print("dropDownViewClosed")
    }
    
    func initViews() {
        
    }
    
}

class FilterTypeView: YNDropDownView {
    @IBOutlet var builtDateSegmentControl: UISegmentedControl!
    @IBOutlet var householdsSegmentControl: UISegmentedControl!
    
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
        self.changeMenu(title: builtDateSegmentControl.titleForSegment(at: builtDateSegmentControl.selectedSegmentIndex)!, at: 1)
        ImageService.imageServiceInstance.filterList = Array<String>()
        ImageService.imageServiceInstance.filterList.append(getFilterName(index: builtDateSegmentControl.selectedSegmentIndex))
        ImageService.imageServiceInstance.applyFilter()
        
        self.hideMenu()
        
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.hideMenu()
        
    }
    func initViews() {
    }
    
    func getFilterName(index: Int) -> String {
        switch index{
        case 0: return FilterType.Japan.rawValue
        case 1: return FilterType.Europe.rawValue
        case 2: return FilterType.Chinese.rawValue
        default:
            return FilterType.None.rawValue
        }
        
    }
    
    
}

