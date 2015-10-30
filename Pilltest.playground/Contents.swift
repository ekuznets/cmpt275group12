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



import UIKit

var error: NSError?
let fileURL = NSBundle.mainBundle().URLForResource("pill", withExtension: "txt")
let content = String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding, error: &error)
let array = content!.componentsSeparatedByString(", ")



class Pill{
    //stored properties
    var name: String
    var DIN: Int
    var drugCode: Int
    
    init(name: String, DIN: Int, drugCode: Int){
        self.name = name
        self.DIN = DIN
        self.drugCode = drugCode
    }
    
    deinit{
        // any necessary cleanup code
    }
    
    func pillDescript () -> String {
        return ""
    }
}
