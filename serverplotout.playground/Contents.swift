//: Playground - noun: a place where people can play


import UIKit
import XCPlayground
XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

//var str = "Hello, playground"

let url = NSURL(string: "http://52.89.151.217/plotout.php")
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
        
        println("jsonObject :\(responseDict)")
        let desease = responseDict["diseasetype"] as! String
        
        println("Parse: \(desease)")
        let location = responseDict["location"] as! String
        println("Parse: \(location)")
        
        var infectedArray = [Int]() // values will be stored in array of integers
        
        let convertToArray = responseDict["arrayInfected"] as! NSArray // this hack is for counting objects inside the responseDict["arrayInfected"] only need for loopCount
        let loopCount = convertToArray.count
        var total: Int = 0 // can be removed only for check that it works
        
        for i in 0..<loopCount
        {
            let arrayInfected: AnyObject! = responseDict["arrayInfected"]![i]
            let StringInt = arrayInfected["infected"] as! String
            var int: Int = StringInt.toInt()!
            total=total+int // can be removed only for check that it works
            
        }
        println(total) // can be removed only for check that it works
    }
}


dataTask.resume()
