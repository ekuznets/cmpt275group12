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

println(array)


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
}

let myPill = Pill(name:array[2],DIN:array[1],drugCode:array[0])

println(myPill.pillDescript())
