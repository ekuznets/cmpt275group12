//
//  ViewController.swift/Users/ekuznets/Desktop/logintest/logintest/ViewController.swift
//  logintest
//
//  Created by Evgeny KUZNETSOV on 10/14/15.
//  Copyright (c) 2015 Evgeny KUZNETSOV. All rights reserved.
//

import UIKit
//import ResearchKit
//
//// http://www.raywenderlich.com/104575/researchkit-tutorial-with-swift usefull stuff for healthkit
//
//extension ViewController : ORKTaskViewControllerDelegate {
//    
//    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
//        //Handle results with taskViewController.result
//        taskViewController.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    @IBAction func consentTapped(sender : AnyObject) {
//        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRunUUID: nil)
//        taskViewController.delegate = self
//        presentViewController(taskViewController, animated: true, completion: nil)
//    }
//    
//    @IBAction func surveyTapped(sender : AnyObject) {
//        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRunUUID: nil)
//        taskViewController.delegate = self
//        presentViewController(taskViewController, animated: true, completion: nil)
//    }
//    
//}
class Pill{
    //stored properties
    var name: String
    var DIN: String
    var drugCode: String
    
    init(name: String, DIN: String, drugCode: String){
        self.name = name
        self.DIN = DIN
        self.drugCode = drugCode
    }
    
    deinit{
        // any necessary cleanup code
    }
    
    func pillDescript () -> String{
        return "Name: \(name)\n" +
            "DIN: \(DIN)\n" +
        "Drug code: \(drugCode)"
    }
    
    func getPillName () -> String{
        return self.name
    }
    func getPillDin () -> String{
        return self.DIN
    }
    
}

func pillSearchName (pills: [Pill], name: String) ->Pill // name getter
{
    for i in 0..<pills.count
    {
        let pill = pills[i]
        if (pill.getPillName()==name)
        {
            return pill
        }
    }
    return pills[0] // a pill to say that we have not found it in a list
}

func pillSearchDin (pills: [Pill], DIN: String) ->Pill //din getter
{
    for i in 0..<pills.count
    {
        let pill = pills[i]
        if (pill.getPillDin()==DIN)
        {
            return pill
        }
    }
    return pills[0] // a pill to say that we have not found it in a list
}


class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var textToChange: UILabel!
    
    @IBAction func buttonRegister(sender: AnyObject)
    {
        let name = self.userName.text
        let pass = self.password.text
        let result = "Username: \(name)" + "," + "password: \(pass)"             
    }
    
    @IBAction func FEEETCH(sender: AnyObject)
    {
//
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
        
        
        
//        var error: NSError?
//        let fileURL = NSBundle.mainBundle().URLForResource("DIN", withExtension: "txt")
//        let content = String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding, error: &error)
//        let separator = NSCharacterSet.newlineCharacterSet() // newline separator
//        let array = content!.componentsSeparatedByCharactersInSet(separator) as [String]
//        
//        println(array)
//        
//        
//        var pillArray = [Pill]() // pill array
//        
//        for i in 0..<array.count
//        {
//            let pilldata = array[i].componentsSeparatedByString(",") //separate each element by comma
//            let myPill=Pill(name:pilldata[2],DIN:pilldata[1],drugCode:pilldata[0]) //creare a pill object
//            pillArray.append(myPill) // append pill object to array
//            //pillArray[i].pillDescript() //print description
//        }
//        
//        //call search tests
//        //var searchNamePill: Pill = pillSearchName(pillArray, "+2 hp")
//        //println(searchNamePill.pillDescript())
//        
//        var searchDINPill: Pill = pillSearchDin(pillArray, "4618")
//        println(searchDINPill.pillDescript())
        

        
    }
    override func viewDidLoad()
    {
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
