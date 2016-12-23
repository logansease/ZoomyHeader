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

    fileprivate var imageViewCell : ZoomyHeaderCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ZoomyHeaderCell.registerZoomyCellIdentifier(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "ZoomyHeaderCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let imageCell = cell as? ZoomyHeaderCell
        {
            imageCell.fullImageView.image = UIImage(named: "city1.jpg")
            imageViewCell = imageCell
            imageCell.originalHeight = 300
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    //MARK: Scrolling header image
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //if we are scrolling the tableview then adjust the scrollview frame accordingly
        if let tableview = scrollView as? UITableView, let imageCell = imageViewCell
        {
            imageCell.didScroll(tableview)
        }
    }

}

