//
//  ViewController.swift
//  PagerViewTest
//
//  Created by Jun Jung on 4/08/20.
//  Copyright © 2020 CheeseStick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    // MARK: - View Variables
    @IBOutlet weak var pagerV: FSPagerView! {
        didSet {
            self.pagerV.register(UINib(nibName:"TestPagerViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
            self.pagerV.decelerationDistance = 1
            self.pagerV.isInfinite = false
            self.pagerV.interitemSpacing = 16
        }
    }
    
    let data:Array<String> = ["Hello", "World", "Swift", "Objective-C", "iOS", "Cheese"]
    
    // MARK: - View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pagerV.dataSource = self
        self.pagerV.delegate = self
    }
    
    // MARK: - FSPagerViewDataSource Methods
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return data.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index) as! TestPagerViewCell
        
        cell.dataLabel.text = "My data is \(data[index])"
        
        return cell
    }
}

