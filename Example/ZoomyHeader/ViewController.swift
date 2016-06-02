//
//  ViewController.swift
//  ZoomyHeader
//
//  Created by Logan Sease on 06/02/2016.
//  Copyright (c) 2016 Logan Sease. All rights reserved.
//

import UIKit
import ZoomyHeader

class ViewController: UITableViewController {

    private var imageViewCell : ZoomyHeaderCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //use auto adjusting tabelview heights
//        tableView.estimatedRowHeight = 300
//        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view, typically from a nib.
        ZoomyHeaderCell.registerZoomyCellIdentifier(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "ZoomyHeaderCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        //TODO: handle a blank row when no coupons or deals are found
        if let imageCell = cell as? ZoomyHeaderCell
        {
            imageCell.fullImageView.image = UIImage(named: "city1.jpg")
            imageViewCell = imageCell
            imageCell.originalHeight = 300
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    //MARK: Scrolling header image
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //if we are scrolling the tableview then adjust the scrollview frame accordingly
        if let tableview = scrollView as? UITableView, imageCell = imageViewCell
        {
            imageCell.didScroll(tableview)
        }
    }

}

