//
//  DecryptViewController.swift
//  DECRYPTo
//
//  Created by Jack Battle on 11/2/22.
//

import UIKit

class DecryptViewController: ViewController, UITextFieldDelegate {
    
    
    // outlets
    @IBOutlet weak var numberEntryField: UITextField!
    @IBOutlet weak var mainWordLabelOutlet: UILabel!
    @IBOutlet weak var fullStringLabelOutlet: UILabel!
    @IBOutlet weak var copyButtonOutlet: UIButton!
    @IBOutlet weak var deleteButtonOutlet: UIButton!
    
    let list = Wordlist()
    
    override func viewDidLoad() {
        print("Decrypt view controller successfully loaded")
        numberEntryField.delegate = self
        
        deleteButtonOutlet.tintColor = .red
    }
    
    //button actions
    @IBAction func copyButtonPressed(_ sender: Any) {
        print("copy button pressed")
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("delete button pressed")
    }
    
    
    // textfield character limit
    let characterlimit = 4
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return (textField.text?.utf16.count ?? 0) + string.utf16.count - range.length <= characterlimit
    }
    
    // textfield updated
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkCharacterCount(textField)
    }
    
    func checkCharacterCount(_ field: UITextField) {
        if field.text?.count == 4 {
           let foundWord = checkWord(field.text!)
    
            mainWordLabelOutlet.text = foundWord
        }else {
            print("current text else case: \(field.text!)")
        }
    }
    
    func checkWord(_ number: String) -> String {
        let fourDigitNumber = Int(number)
        print("Int: \(fourDigitNumber ?? 9999)")
        
        if let word = list.wordlistDict[fourDigitNumber!] {
            print(word)
            return word
        }else {
            return "Not Found"
        }
    }
}
