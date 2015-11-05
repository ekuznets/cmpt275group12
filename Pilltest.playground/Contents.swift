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
    let myPill=Pill(name:"Not Exist",DIN: "000000",drugCode: "000000")
    return myPill // a pill to say that we have not found it in a list
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
    let myPill=Pill(name:"Not Exist",DIN: "000000",drugCode: "000000")
    return myPill // a pill to say that we have not found it in a list
}

//D // S // T



let nameOfPill="regwyrgewyr"
let nameOfPillUpper=nameOfPill.uppercaseString
let PillLetter = nameOfPillUpper[nameOfPill.startIndex]
let fileNameInit = "\(PillLetter)"
var result: String = ""

if(fileNameInit=="D" || fileNameInit=="S" || fileNameInit=="T")
{
    
    // super hacky code, dont try to undestand
    
    
    let extraText = "\(fileNameInit)part1"
    var error: NSError?
    let fileURL = NSBundle.mainBundle().URLForResource(extraText, withExtension: "txt")
    let content = String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding, error: &error)
    let array = content!.componentsSeparatedByString("\r\n") as [String]
    
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
    var searchNamePill: Pill = pillSearchName(pillArray, nameOfPill)
    result = searchNamePill.pillDescript()
    println(result)

}
else
{
    var error: NSError?
    let fileURL = NSBundle.mainBundle().URLForResource(fileNameInit, withExtension: "txt")
    let content = String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding, error: &error)
    let array = content!.componentsSeparatedByString("\r\n") as [String]

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
    var searchNamePill: Pill = pillSearchName(pillArray, nameOfPill)
    result = searchNamePill.pillDescript()
    println(result)

}




