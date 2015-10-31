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


var error: NSError?
let fileURL = NSBundle.mainBundle().URLForResource("pill", withExtension: "txt")
let content = String(contentsOfURL: fileURL!, encoding: NSUTF8StringEncoding, error: &error)
let separator = NSCharacterSet.newlineCharacterSet() // newline separator
let array = content!.componentsSeparatedByCharactersInSet(separator) as [String]

println(array)


var pillArray = [Pill]() // pill array

for i in 0..<array.count
{
    let pilldata = array[i].componentsSeparatedByString(", ") //separate each element by comma
    let myPill=Pill(name:pilldata[2],DIN:pilldata[1],drugCode:pilldata[0]) //creare a pill object
    pillArray.append(myPill) // append pill object to array
    pillArray[i].pillDescript() //print description
}

//call search tests
var searchNamePill: Pill = pillSearchName(pillArray, "+2 hp")
println(searchNamePill.pillDescript())

var searchDINPill: Pill = pillSearchDin(pillArray, "001337")
println(searchDINPill.pillDescript())


//let myPill = Pill(name:array[2],DIN:array[1],drugCode:array[0])

//println(myPill.pillDescript())
