
import UIKit

class FirstViewController: UIViewController {
    
    //Link to UI
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //Link to Model
    var calculations = Calculations()
    
    //Variables
    var tipChoice = "0%"
    var splitChoice = 2
    var billPerPerson: Float = 0.0
    
    @IBAction func tipOptionChanged(_ sender: UIButton) {
        tipChoice = sender.currentTitle ?? "Tip Choice Error"
        switch tipChoice {
        case "0%":
            zeroPercentTip.isSelected = true
            tenPercentTip.isSelected = false
            twentyPercentTip.isSelected = false
        case "10%":
            zeroPercentTip.isSelected = false
            tenPercentTip.isSelected = true
            twentyPercentTip.isSelected = false
        case "20%":
            zeroPercentTip.isSelected = false
            tenPercentTip.isSelected = false
            twentyPercentTip.isSelected = true
        default:
            zeroPercentTip.isSelected = true
            tenPercentTip.isSelected = false
            twentyPercentTip.isSelected = false
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func splitStepperTapped(_ sender: UIStepper) {
        splitChoice = Int(sender.value)
        splitNumberLabel.text = String(splitChoice)
        billTextField.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CalculateTransition" {
            let secondView = segue.destination as! SecondViewController
            secondView.amountPerPerson = billPerPerson
            secondView.numberOfPeople = splitChoice
            secondView.tipAmount = tipChoice
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if billTextField.text != "" {
            if let unwrappedBillValue = billTextField.text {
                let billValue = Float(unwrappedBillValue)!
                billPerPerson = calculations.billPerPersonCalc(bill: billValue, tips: tipChoice, person: Float(splitChoice))
            }
            performSegue(withIdentifier: "CalculateTransition", sender: self)
        } else {
            print("Calculation Error")
        }
    }

}

