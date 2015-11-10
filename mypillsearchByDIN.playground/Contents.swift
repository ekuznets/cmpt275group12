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

let DINofPill="410417"

var result: String = "000000" // initial result


for i in 0..<8
{
    let counter = "\(i)"
    let extraText = "DINpart\(counter)"
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
        
    }
    //call search tests
    var searchNamePill: Pill = pillSearchDin(pillArray, DINofPill)
    result = searchNamePill.pillDescript()
    if(searchNamePill.getPillDin() != "000000") // onces we get a pill that is not zero break
    {
        break; // otherwise just mean not found
    }
}

println(result)
    





