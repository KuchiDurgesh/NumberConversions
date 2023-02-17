//
//  ViewController.swift
//  NumberConversion
//
//  Created by Durge K on 2/17/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Decimal: UILabel!
    
    @IBOutlet weak var Binary: UILabel!
    
    @IBOutlet weak var TextBoxLabel: UILabel!
    
    @IBOutlet weak var Octal: UILabel!
    
    
    @IBOutlet weak var HexaDecimal: UILabel!
    
    @IBAction func Clear(_ sender: Any) {
        Decimal.text=""
        Binary.text=""
        Octal.text=""
        HexaDecimal.text=""
    }
    
    @IBAction func SegmentControl(_ sender: Any) {
        
    }
    
}

