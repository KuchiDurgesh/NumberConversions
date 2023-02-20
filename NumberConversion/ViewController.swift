//
//  ViewController.swift
//  NumberConversion
//
//  Created by Durge K on 2/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberFormat: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Notification: UILabel!
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
        Notification.text=""
    }
    @IBAction func convert(_ sender: Any) {
        let typeIndex = numberFormat.selectedSegmentIndex
        let val = Int(Userinput.text ?? "0") ?? 0
        let text: String? = Userinput.text
        let nonOptionalString: String = text!
        switch(typeIndex) {
        case 0 : decimalToAll(value: val, text: nonOptionalString)
        case 1 : binaryToAll(value: val, text: nonOptionalString)
        case 2 : octalToAll(value: val, text: nonOptionalString)
        case 3 : hexaToAll(value: nonOptionalString, text: nonOptionalString)
        default: return
        }
    }
    func isNotBinaryNumber(_ number: String) -> Bool
    {
        return number.contains(where: { char in
            return char != "0" && char != "1"
        })
    }
    func isNotDecimalNumber(_ number: String) -> Bool
    {
        if let _ = Double(number) {
            return true
        } else {
            return false
        }
    }
    func isNotOctalNumber(_ str: String) -> Bool {
        let validOctalCharacters = CharacterSet(charactersIn: "01234567")
        return str.rangeOfCharacter(from: validOctalCharacters.inverted) != nil
    }
    
    func isNotHexadecimalNumber(_ input: String) -> Bool {
        let validHexadecimalCharacters = CharacterSet(charactersIn: "0123456789abcdefABCDEF")
        return input.rangeOfCharacter(from: validHexadecimalCharacters.inverted) != nil
    }
    func clearScr() {
        Decimal.text=""
        Binary.text=""
        Octal.text=""
        HexaDecimal.text=""
    }
    
    func decimalToBinary(value:Int)
    {
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
    }
    func decimalToOctal(value:Int)
    {
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
    }
    func decimalToHexa(value:Int)
    {
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
    
    func decimalToAll(value:Int,text: String)
    {
        if(isNotDecimalNumber(text) != true)
        {
            Notification.text="Please enter only decimal values!"
            clearScr()
            return
        }
        else
        {
            Notification.text=""
        }
        Decimal.text = String(value)
        decimalToBinary(value: value)
        decimalToOctal(value: value)
        decimalToHexa(value: value)
    }
    
    
    func binaryToAll(value:Int, text: String)
    {
        if(isNotBinaryNumber(text) != false)
        {
            Notification.text="Please enter only binary values!"
            clearScr()
            return
        }
        else
        {
            Notification.text=""
        }
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
        decimalToOctal(value: decimalNum)
        decimalToHexa(value: decimalNum)
    }
    
    func octalToAll(value:Int,text: String ) {
        if(isNotOctalNumber(text) != false)
        {
            Notification.text="Please enter only Octal values!"
            clearScr()
            return
        }
        else
        {
            Notification.text=""
        }
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
        decimalToHexa(value: result)
        decimalToBinary(value: result)
    }
    
    func hexaToAll(value: String,text: String)
    {
        if(isNotHexadecimalNumber(text) != false)
        {
            Notification.text="Please enter only Hexa values!"
            clearScr()
            return
        }
        else
        {
            Notification.text=""
        }
        let hexVal = value.capitalized
        HexaDecimal.text=String(hexVal)
        let len = hexVal.count
        
        // Initializing base value to 1, i.e 16^0
        var base = 1
        
        var dec_val = 0
        
        // Extracting characters as digits from last character
        for i in (0..<len).reversed() {
            let char = hexVal[hexVal.index(hexVal.startIndex, offsetBy: i)]
            // if character lies in '0'-'9', converting it to integral 0-9 by subtracting 48 from ASCII value
            if char >= "0" && char <= "9" {
                dec_val += (Int(char.asciiValue!) - 48) * base
                
                // incrementing base by power
                base = base * 16
            }
            // if character lies in 'A'-'F' , converting it to integral 10 - 15 by subtracting 55 from ASCII value
            else if char >= "A" && char <= "F" {
                dec_val += (Int(char.asciiValue!) - 55) * base
                
                // incrementing base by power
                base = base * 16
            }
        }
        Decimal.text = String(dec_val)
        decimalToOctal(value: dec_val)
        decimalToBinary(value: dec_val)
    }
}
        
    

