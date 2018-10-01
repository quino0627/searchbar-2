import UIKit

class Data: NSObject {
    var main:String
    var detail:detailType
    
    
    init(main: String, detail: detailType) {
        self.main = main
        self.detail = detail
    }
}

enum detailType:String {
    case A = "A"
    case B = "B"
}
