
import UIKit

struct Calculations {
    
    var percentage: Float? = 0.0
    
    mutating func billPerPersonCalc (bill: Float, tips: String, person: Float) -> Float {
        tipPercentCalc(input: tips)
        let billPerPerson = (bill*(1+percentage!))/person
        return billPerPerson
    }
    
    mutating func tipPercentCalc (input: String) {
        switch input {
        case "0%":
            self.percentage = 0.0
        case "10%":
            self.percentage = 0.1
        case "20%":
            self.percentage = 0.2
        default:
            self.percentage = nil
        }
    }
}
