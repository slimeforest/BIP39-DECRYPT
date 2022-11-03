//
//  ViewController.swift
//  DECRYPTo
//
//  Created by Jack Battle on 11/2/22.
//

import UIKit

class ViewController: UIViewController {

    let wordlist = Wordlist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Total dict count: \(wordlist.wordlistDict.count)")
    }


}

