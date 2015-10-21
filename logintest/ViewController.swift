//
//  ViewController.swift/Users/ekuznets/Desktop/logintest/logintest/ViewController.swift
//  logintest
//
//  Created by Evgeny KUZNETSOV on 10/14/15.
//  Copyright (c) 2015 Evgeny KUZNETSOV. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var textToChange: UILabel!
    
    @IBAction func buttonRegister(sender: AnyObject)
    {
        let name = self.userName.text
        let pass = self.password.text
        let result = "Username: \(name)" + "," + "password: \(pass)"
        
        let myAlert = UIAlertController(title: result, message: nil,preferredStyle: UIAlertControllerStyle.Alert)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
                
    }
    
    @IBAction func FEEETCH(sender: AnyObject)
    {
        let url = NSURL(string: "http://52.89.151.217/test.php")
        
        let session = NSURLSession.sharedSession()

        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url!)
        {
            (data, response, error) in
            if error != nil
            {
                
                println(error.description)
                
            }
            else
            {
                var responseDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSDictionary
                
                println("jsonObject :\(responseDict)")
                let success = responseDict["Itemstuff"] as! String
                println("Parse: \(success)")
                self.textToChange.text = success
            }
            
        }
        
        dataTask.resume()
        
        
        
    }
    override func viewDidLoad()
    {
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
