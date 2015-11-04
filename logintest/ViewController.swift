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
        
        let myAlert = UIAlertController(title: result, message: nil,preferredStyle: UIAlertControllerStyle.Alert)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
                
    }
    
    @IBAction func FEEETCH(sender: AnyObject)
    {
//        let url = NSURL(string: "http://52.89.151.217/test.php")
//        
//        let session = NSURLSession.sharedSession()
//
//        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url!)
//        {
//            (data, response, error) in
//            if error != nil
//            {
//                
//                println(error.description)
//                
//            }
//            else
//            {
//                var responseDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSDictionary
//                
//                println("jsonObject :\(responseDict)")
//                let desease = responseDict["diseasetype"] as! String
//                
//                println("Parse: \(desease)")
//                let location = responseDict["location"] as! String
//                println("Parse: \(location)")
//                
//                
//                let arrayInfected: AnyObject! = responseDict["arrayInfected"]![0]
//                let StringInt = arrayInfected["infected"] as! String
//                let int = StringInt.toInt()
//                
//            }
//            
//        }
//        
//        dataTask.resume()
        
        //
        //  pillcode.swift
        //  logintest
        //
        //  Created by Evgeny KUZNETSOV on 11/3/15.
        //  Copyright (c) 2015 Evgeny KUZNETSOV. All rights reserved.
        //
        
        
        //: Playground - noun: a place where people can play
        //let file: NSFileHandle? = NSFileHandle(forReadingAtPath: "pill.txt")
        //
        //if file == nil {
        //    println("File open failed")
        //} else {
        //    file?.seekToFileOffset(10)
        //    let databuffer = file?.readDataOfLength(5)
        //    file?.closeFile()
        //}
        
        //let file: NSFileHandle? = NSFileHandle(forReadingAtPath: "Macintoshi/Users/Andrew/Desktop/pill.txt")
        //
        //if file == nil {
        //    println("File open failed")
        //} else {
        //    file?.closeFile()
        //}
        
        var error: NSError?
        let fileURL = NSBundle.mainBundle().URLForResource("DIN", withExtension: "txt")
        let content = String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding, error: &error)
        let separator = NSCharacterSet.newlineCharacterSet() // newline separator
        let array = content!.componentsSeparatedByCharactersInSet(separator) as [String]
        
        println(array)
        
        
        var pillArray = [Pill]() // pill array
        
        for i in 0..<array.count
        {
            let pilldata = array[i].componentsSeparatedByString(",") //separate each element by comma
            let myPill=Pill(name:pilldata[2],DIN:pilldata[1],drugCode:pilldata[0]) //creare a pill object
            pillArray.append(myPill) // append pill object to array
            //pillArray[i].pillDescript() //print description
        }
        
        //call search tests
        //var searchNamePill: Pill = pillSearchName(pillArray, "+2 hp")
        //println(searchNamePill.pillDescript())
        
        var searchDINPill: Pill = pillSearchDin(pillArray, "4618")
        println(searchDINPill.pillDescript())
        
        
        //let myPill = Pill(name:array[2],DIN:array[1],drugCode:array[0])
        
        //println(myPill.pillDescript())
        
    }
    override func viewDidLoad()
    {
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
