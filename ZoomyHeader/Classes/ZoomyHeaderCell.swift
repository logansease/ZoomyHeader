//
//  ImageCell.swift
//  WhereToGo
//
//  Created by lsease on 4/28/16.
//  Copyright © 2016 Logan Sease. All rights reserved.
//

import UIKit

public class ZoomyHeaderCell : UITableViewCell, UIScrollViewDelegate {

    @IBOutlet public var fullImageView: UIImageView!
    @IBOutlet var scrollView : UIScrollView!
    
    public var originalHeight : CGFloat = 150
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fullImageView.autoresizingMask = .FlexibleHeight
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //this method will be called by our scroll view to tell it to zoom on the images
    public func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return fullImageView
    }
    
    //this should be called by our view controller when the tableview scrolls
    public func didScroll(tableView : UITableView!)
    {
        var frame = scrollView.frame;
        frame.size.height =  max((originalHeight - tableView.contentOffset.y),0);
        frame.origin.y = tableView.contentOffset.y;
        scrollView.frame = frame;
        scrollView.zoomScale = 1 + (abs(min(tableView.contentOffset.y,0))/320.0);
    }
    
    public class func registerZoomyCellIdentifier(tableView: UITableView!, identifier : String! = "ZoomyHeaderCell")
    {
        let podBundle = NSBundle(forClass: self)
        if let bundleURL = podBundle.URLForResource("ZoomyHeader", withExtension: "bundle") {
            
            if let bundle = NSBundle(URL: bundleURL) {
                
                let cellNib = UINib(nibName: "ZoomyHeaderCell", bundle: bundle)
                tableView.registerNib(cellNib, forCellReuseIdentifier: identifier)
                
            }else {
                
                assertionFailure("Could not load the bundle")
            }
            
        }else {
            
            assertionFailure("Could not create a path to the bundle")
            
        }
    }
    
}
