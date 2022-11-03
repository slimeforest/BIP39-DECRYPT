//
//  DecryptViewController.swift
//  DECRYPTo
//
//  Created by Jack Battle on 11/2/22.
//

import UIKit

class DecryptViewController: ViewController, UITextFieldDelegate {
    
    @IBOutlet weak var numberEntryField: UITextField!
    @IBOutlet weak var mainWordLabelOutlet: UILabel!
    @IBOutlet weak var fullStringLabelOutlet: UILabel!
    
    @IBAction func copyButtonPressed(_ sender: Any) {
        print("copy button pressed")
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("delete button pressed")
    }
    
    override func viewDidLoad() {
        print("Decrypt view controller successfully loaded")
        numberEntryField.delegate = self
    }
    
    let characterlimit = 4
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return (textField.text?.utf16.count ?? 0) + string.utf16.count - range.length <= characterlimit
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("func called and current text: \(textField.text!)")
        checkCharacterCount(textField)
    }
    
    func checkCharacterCount(_ field: UITextField) {
        if field.text?.count == 4 {
            print("current text: \(field.text!)")
            mainWordLabelOutlet.text = field.text
        }else {
            print("current text else case: \(field.text!)")
        }
    }
    
}
