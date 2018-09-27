
import UIKit

class data: NSObject {
    var deviceName:String
    var companyName:companyType
    
    
    init(deviceName: String, companyName: companyType) {
        self.deviceName = deviceName
        self.companyName = companyName
    }
}

enum companyType:String {
    case Samsung = "Samsung"
    case Apple = "Apple"
    case LG = "LG"
}
