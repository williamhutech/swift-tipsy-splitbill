

import UIKit

class SecondViewController: UIViewController {

    //Link to UI
    @IBOutlet weak var amountPerPersonLabel: UILabel!
    @IBOutlet weak var splitMessageLabel: UILabel!
    
    var amountPerPerson: Float = 0.0
    var numberOfPeople: Int = 0
    var tipAmount = "Unknown"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountPerPersonLabel.text = "$"+String(format: "%.2f", amountPerPerson)
        splitMessageLabel.text = "Split between \(numberOfPeople) people, with \(tipAmount) tip."
    }
    
    @IBAction func recalculateTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
