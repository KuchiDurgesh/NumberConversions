//
//  ViewController.swift
//  NumberConversion
//
//  Created by Durge K on 2/17/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberFormat: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Decimal: UILabel!
    @IBOutlet weak var Binary: UILabel!
    @IBOutlet weak var TextBoxLabel: UILabel!
    @IBOutlet weak var Octal: UILabel!
    @IBOutlet weak var Userinput: UITextField!
    @IBOutlet weak var HexaDecimal: UILabel!
    @IBAction func Clear(_ sender: Any) {
        Decimal.text=""
        Binary.text=""
        Octal.text=""
        HexaDecimal.text=""
    }
    @IBAction func convert(_ sender: Any) {
        let typeIndex = numberFormat.selectedSegmentIndex
                let val = Int(Userinput.text ?? "0") ?? 0
                let octVal = Userinput.text
                switch(typeIndex) {
                    case 0 : decimalToAll(value: val)
                    case 1 : binaryToAll(value: val)
                    case 2 : octalToAll(value: val)
                default: return
                }
        }
                
    func decimalToAll(value:Int) {
        var number = value
        Decimal.text = String(value)
        
        
        var octalNumber = 0
        var count = 1
        
        while(number != 0) {
            
            let rem = number % 8
            
            octalNumber += rem * count
            
            count = count * 10
            number /= 8
            
        }
        
        Octal.text = String(octalNumber)
        
        var decimalValue = value
        var binaryValue = ""
        while(decimalValue > 0) {
            
            if ((decimalValue & 1) == 1){
                
                binaryValue += "1"
            }
            else {
                
                binaryValue += "0"
            }
            
            decimalValue >>= 1
        }
        
        let res = String(binaryValue.reversed())
        
        Binary.text = String(res)
        
        var decimal = value
        var rem: Int
        var hex = ""
        let hexchars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
        while decimal > 0 {
            rem = decimal % 16
            hex = String(hexchars[rem]) + hex
            decimal /= 16
        }
        HexaDecimal.text=hex
    }
    
                
            func binaryToAll(value:Int) {
                    var number = value
                    var decimalNum = 0
                    var baseVal = 1
                    Binary.text=String(value)
                    while(number > 0){

                       let endVal = number % 10
                       number /= 10
                       decimalNum += endVal * baseVal
                       baseVal *= 2
                    }
                    Decimal.text = String(decimalNum)
                    var binToHex = decimalNum
                    var octalNumber = 0
                    var count = 1
                
                    while(decimalNum != 0) {
                    
                    let rem = decimalNum % 8
                    
                    octalNumber += rem * count
                    
                    count = count * 10
                    decimalNum /= 8
                    
                }
                
                Octal.text = String(octalNumber)
                var decimal = binToHex
                var rem: Int
                var hex = ""
                let hexchars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                while decimal > 0 {
                    rem = decimal % 16
                    hex = String(hexchars[rem]) + hex
                    decimal /= 16
                }
                HexaDecimal.text=hex
                }
                
                func octalToAll(value:Int) {
                    Octal.text = String(value)
                    let a: Int = value

                    // Initialize result variable to 0.
                    var result: Int = 0

                    // Take a copy of input
                    var copy_a: Int = a

                    var i: Int = 0
                    while copy_a > 0 {
                        // Take the last digit
                        let temp: Int = copy_a % 10

                        // Appropriate power on 8 suitable to its position.
                        let p: Double = pow(8, Double(i))

                        // Multiply the digits to the into the Input and then add it to result
                        result += Int(Double(temp) * p)
                        copy_a /= 10

                        i += 1
                    }
                    Decimal.text = String(result)
                    var decimalValue = result
                    var binaryValue = ""
                    while(decimalValue > 0) {
                        
                        if ((decimalValue & 1) == 1){
                            
                            binaryValue += "1"
                        }
                        else {
                            
                            binaryValue += "0"
                        }
                        
                        decimalValue >>= 1
                    }
                    
                    let res = String(binaryValue.reversed())
                    
                    Binary.text = String(res)
                    var decimal = result
                    var rem: Int
                    var hex = ""
                    let hexchars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
                    while decimal > 0 {
                        rem = decimal % 16
                        hex = String(hexchars[rem]) + hex
                        decimal /= 16
                    }
                    HexaDecimal.text=hex
                }
                
                func hexaToAll() {
                    
                }
            }
        
    

