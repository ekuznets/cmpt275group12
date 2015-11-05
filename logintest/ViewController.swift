//
//  ViewController.swift/Users/ekuznets/Desktop/logintest/logintest/ViewController.swift
//  logintest
//
//  Created by Evgeny KUZNETSOV on 10/14/15.
//  Copyright (c) 2015 Evgeny KUZNETSOV. All rights reserved.
//

import UIKit
import ResearchKit
//
//// http://www.raywenderlich.com/104575/researchkit-tutorial-with-swift usefull stuff for healthkit
//

extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        //Handle results with taskViewController.result
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var textToChange: UILabel!
    
    @IBAction func surveyTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func buttonRegister(sender: AnyObject)
    {
        let name = self.userName.text
        let pass = self.password.text
        let result = "Username: \(name)" + "," + "password: \(pass)"             
    }
    
    @IBAction func FEEETCH(sender: AnyObject)
    {
        let myUrl = NSURL(string: "http://52.89.151.217/login.php")
        let request = NSMutableURLRequest(URL:myUrl!)
        request.HTTPMethod = "POST"
        
        // Compose a query string
        
        let postString = "email=\(self.userName.text)&password=\(self.password.text)" // type email and password
        println(postString)
        
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
        
    }
    override func viewDidLoad()
    {
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
