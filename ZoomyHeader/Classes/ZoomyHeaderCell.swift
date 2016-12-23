//
//  ImageCell.swift
//  WhereToGo
//
//  Created by lsease on 4/28/16.
//  Copyright © 2016 Logan Sease. All rights reserved.
//

import UIKit

open class ZoomyHeaderCell : UITableViewCell, UIScrollViewDelegate {

    @IBOutlet open var fullImageView: UIImageView!
    @IBOutlet var scrollView : UIScrollView!
    
    open var originalHeight : CGFloat = 150
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fullImageView.autoresizingMask = .flexibleHeight
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //this method will be called by our scroll view to tell it to zoom on the images
    open func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return fullImageView
    }
    
    //this should be called by our view controller when the tableview scrolls
    open func didScroll(_ tableView : UITableView!)
    {
        var frame = scrollView.frame;
        frame.size.height =  max((originalHeight - tableView.contentOffset.y),0);
        frame.origin.y = tableView.contentOffset.y;
        scrollView.frame = frame;
        scrollView.zoomScale = 1 + (abs(min(tableView.contentOffset.y,0))/320.0);
    }
    
    open class func registerZoomyCellIdentifier(_ tableView: UITableView!, identifier : String! = "ZoomyHeaderCell")
    {
        let podBundle = Bundle(for: self)
        if let bundleURL = podBundle.url(forResource: "ZoomyHeader", withExtension: "bundle") {
            
            if let bundle = Bundle(url: bundleURL) {
                
                let cellNib = UINib(nibName: "ZoomyHeaderCell", bundle: bundle)
                tableView.register(cellNib, forCellReuseIdentifier: identifier)
                
            }else {
                
                assertionFailure("Could not load the bundle")
            }
            
        }else {
            
            assertionFailure("Could not create a path to the bundle")
            
        }
    }
    
}
