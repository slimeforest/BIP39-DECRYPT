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
    
    let logicBrain = LogicBrain()
    
    let list = Wordlist()
    var userPhrase = [String]()
    var phraseToCopy = ""
    
    let defaultTextCheck = "Begin by entering your BIP39 codes and clicking 'next' to temporarily save the conversion here. Deletes on app termination or delete button."
    
    override func viewDidLoad() {
        numberEntryField.delegate = self
        deleteButtonOutlet.tintColor = .red
        
        numberEntryField.inputAccessoryView = toolBar()
        numberEntryField.becomeFirstResponder()
        
        userPhrase = []
        self.title = "Decrypt"
    }
    
    //MARK: - Copy and Delete Buttons
    
    @IBAction func copyButtonPressed(_ sender: Any) {
        
        phraseToCopy = fullStringLabelOutlet.text!
        phraseToCopy.remove(at: phraseToCopy.startIndex)
        
        
        UIPasteboard.general.string = phraseToCopy
        presentCopyAlert()
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        userPhrase = []
        fullStringLabelOutlet.text = defaultTextCheck
        mainWordLabelOutlet.text = "Enter code"
    }
    
    //MARK: - Textfield Handling
    
    // textfield character limit
    let characterlimit = 4
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return (textField.text?.utf16.count ?? 0) + string.utf16.count - range.length <= characterlimit
    }
    
    // textfield updated
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let enteredWord = textField.text!
        let decryptedWord = logicBrain.decrypt(enteredWord)
        
        if decryptedWord == "Not Found" {
            mainWordLabelOutlet.text = "Not Found"
        }else {
            mainWordLabelOutlet.text = decryptedWord
        }
    }

    //MARK: - Next Button
    
    // Add Next Button To Keyboard
    func toolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Next"
        let doneButton = UIBarButtonItem(title: buttonTitle, style: .done, target: self, action: #selector(onClickDoneButton))
        toolBar.setItems([space, space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }
    
    @objc func onClickDoneButton(){
        if userPhrase.count <= 23 {
            let word = mainWordLabelOutlet.text!
            
            if word == "Not Found" || word == "Enter code" {
                presentInvalidEntryAlert(type: word)
            }else {
                userPhrase.append(mainWordLabelOutlet.text!)
            }
            
            var completePhrase: String = ""
            
            for word in userPhrase {
                completePhrase += " \(word)"
                print(completePhrase)
                fullStringLabelOutlet.text = completePhrase
                numberEntryField.text = ""
            }
        }else {
            presentCharacerLimitAlert()
        }
    }
    
    
    //MARK: - Alert Handling
    
    func presentCharacerLimitAlert() {
        let alert = UIAlertController(title: "24 Word Limit Reached", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentCopyAlert() {
        let alert = UIAlertController(title: "Copied!", message: "Your full recovery phrase has been copied to your clipboard.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentInvalidEntryAlert(type: String) {
        if type == "Enter code" || type == "Not Found" {
            let alert = UIAlertController(title: "Error", message: "'\(type)' is not a valid entry.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if type == defaultTextCheck {
            let alert = UIAlertController(title: "Error", message: "Please enter a BIP39 code.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
