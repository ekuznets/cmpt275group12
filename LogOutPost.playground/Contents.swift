//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

let myUrl = NSURL(string: "http://52.89.151.217/logout.php")
let request = NSMutableURLRequest(URL:myUrl!)
request.HTTPMethod = "POST"

// Compose a query string
let postString = "email=ak@sfu.ca&password=123" // type email and password
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
