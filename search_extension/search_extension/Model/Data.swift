
import UIKit

class Data {
    var main:String
    var detail:detailtype
    
    
    init(main: String, detail: detailtype) {
        self.main = main
        self.detail = detail
    }
}

enum detailtype:String {
    case A = "A"
    case B = "B"
}
