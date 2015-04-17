//
//  PhotosViewController.swift
//  Week1
//
//  Created by Rob Hislop on 4/16/15.
//  Copyright (c) 2015 Will Johansson and Rob Hislop. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    var photos : NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var clientId = "92addcfd03f742eebe93495679c8b400"
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.photos = responseDictionary["data"] as! NSArray
//            self.tableView.reloadData()
            
            println("response: \(self.photos)")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
