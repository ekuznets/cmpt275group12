//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

let myUrl = NSURL(string: "http://52.89.151.217/login.php")
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
    
}



task.resume()
