//
//  logicBrain.swift
//  BIP39 DECRYPT
//
//  Created by Jack Battle on 11/9/22.
//

import Foundation

class LogicBrain {
    
    let list = Wordlist()
    let singleRange = 1...9
    let doubleRange = 10...99
    let tripleRange = 100...999
    
    //MARK: - Decrypt Word
    
    func decrypt(_ word: String) -> String {
        
        if word.count == 4 {
          return decryptWord(numToDecrypt: word)
            
        }else {
            print("character counter under 4")
            return "Not Found"
        }
    }
    
    func encrypt(_ word: String) -> String {
        if word.count >= 3 {
            return encryptWord(userWord: word, dict: list.wordlistDict)
        }else {
            print("character count under 3")
            return "Not Found"
        }
    }
    
    
    //MARK: - Decrypt Word
    func decryptWord(numToDecrypt: String) -> String {
        let fourDigitNumber = Int(numToDecrypt)
        
        if let word = list.wordlistDict[fourDigitNumber!] {
            return word
        }else {
            return "Not Found"
        }
    }
    
    //MARK: - Encrypt Word
    
    func encryptWord(userWord: String, dict: [Int:String]) -> String{
        let word = findKeyForValue(value: userWord, dictionary: dict)
        
        return word ?? "WORD ERROR"
    }
    
    func findKeyForValue(value: String, dictionary: [Int:String]) ->String?
    {
        
        let dict = dictionary
        
        if let retrievedKey = (dict.filter { $0.value == "\(value)" }).first?.key{
            
            if singleRange.contains(retrievedKey){
                return "000\(retrievedKey.description)"
            }else if doubleRange.contains(retrievedKey){
                return "00\(retrievedKey.description)"
            }else if tripleRange.contains(retrievedKey){
                return "0\(retrievedKey.description)"
            }else{
                return retrievedKey.description
            }
        }else {
            return "Not Found"
        }
    }
}
