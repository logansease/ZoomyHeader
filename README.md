# ZoomyHeader

Zoomy header is a way to add an image cell to your UITableView that will zoom in as you scroll up, similar to Twitter and other apps.

##Usage

```

import ZoomyHeader

class ViewController: UITableViewController {

//keep a reference to the zoomyHeaderCell
private var imageViewCell : ZoomyHeaderCell?

override func viewDidLoad() {
    super.viewDidLoad()
    
    //register zoomyHeaderCell with your tableView
    ZoomyHeaderCell.registerZoomyCellIdentifier(tableView)
}

//MARK: TableView
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    //dequeue a zoomyheaderCell
    let identifier = "ZoomyHeaderCell"
    let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)

    //set up our header cell with our image, keep our reference to it and tell the class its initial height
    if let imageCell = cell as? ZoomyHeaderCell
    {
        imageCell.fullImageView.image = UIImage(named: "city1.jpg")
        imageViewCell = imageCell
        imageCell.originalHeight = 300
    }
    return cell
}

//MARK: Scroll View Delegate

//Notify the header cell that it should adjust as the tableview scrolls
override func scrollViewDidScroll(scrollView: UIScrollView) {

    //if we are scrolling the tableview then adjust the scrollview frame accordingly
    if let tableview = scrollView as? UITableView, imageCell = imageViewCell
    {
        imageCell.didScroll(tableview)
    }
}

```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8+

## Installation

ZoomyHeader is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ZoomyHeader"
```

## Author

Logan Sease, lsease@gmail.com

## License

ZoomyHeader is available under the MIT license. See the LICENSE file for more info.
