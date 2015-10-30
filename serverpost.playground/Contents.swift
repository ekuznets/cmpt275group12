//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)


//let url = NSURL(string: "http://52.89.151.217/test.php")
//let session = NSURLSession.sharedSession()
//
//let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
//    //println(NSString(data: data, encoding: NSUTF8StringEncoding))
//    if error != nil{
//        println(error.description)
//        
//    }
//    else{
//        var responseDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSDictionary
//
//    }
//}
//
//dataTask.resume()

//var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//var session = NSURLSession(configuration: configuration)
//var location = "BC"
//var disease = "flu"
//let params:[String: AnyObject] = ["Location" : location, "Disease" : disease ]
//
//let url = NSURL(string:"http://52.89.151.217/plotin.php")
//let request = NSMutableURLRequest(URL: url!)
//request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//request.HTTPMethod = "POST"
//var err: NSError?
//
//request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions.allZeros, error: &err)
//
//let task = session.dataTaskWithRequest(request) {
//    data, response, error in
//    
//    if let httpResponse = response as? NSHTTPURLResponse {
//        if httpResponse.statusCode != 200 {
//            println("response was not 200: \(response)")
//            return
//        }
//    }
//    
//    if (error != nil) {
//        println("error submitting request: \(error)")
//        return
//    }
//    
//    // handle the data of the successful response here
//    var result = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as? NSDictionary
//    println(result)
//}

let myUrl = NSURL(string: "http://52.89.151.217/plotin.php")
let request = NSMutableURLRequest(URL:myUrl!)
request.HTTPMethod = "POST"

// Compose a query string
let postString = "location=BC&disease=flu"
request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);

let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {(data, response, error) in
    
    if error != nil
    {
        println("error=\(error)")
        //return
    }
    
    // You can print out response object
    println("response = \(response)")
    
    // Print out response body
    let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
    println("responseString = \(responseString)")
    
    //Let’s convert response sent from a server side script to a NSDictionary object:
    
    var err: NSError?
    var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
    
    if let parseJSON = myJSON {
        // Now we can access value of First Name by its key
        var firstNameValue = parseJSON["location"] as? String
        println("firstNameValue: \(firstNameValue)")
    }
    
}



task.resume()





