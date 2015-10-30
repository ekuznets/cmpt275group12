//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

//var str = "Hello, playground"

let url = NSURL(string: "http://52.89.151.217/test.php")
let session = NSURLSession.sharedSession()

//let dataTask = session.dataTaskWithURL(url!, completionHandler: { (data: NSData!, response:NSURLResponse!,
//    error: NSError!) -> Void in
//    
//})

let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
    //println(NSString(data: data, encoding: NSUTF8StringEncoding))
    if error != nil{
        println(error.description)
        
    }
    else{
        var responseDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSDictionary

    }
}


dataTask.resume()
