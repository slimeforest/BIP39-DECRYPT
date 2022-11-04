//
//  ViewController.swift
//  DECRYPTo
//
//  Created by Jack Battle on 11/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var decryptoLabelOutlet: UILabel!
    @IBOutlet weak var btcAddressOutlet: UILabel!
    @IBOutlet weak var ethAddressOutlet: UILabel!
    @IBOutlet weak var adaAddressOutlet: UILabel!
    @IBOutlet weak var dogeAddressOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // address buttons pressed
    @IBAction func btcButtonPressed(_ sender: Any) {
        UIPasteboard.general.string = btcAddressOutlet.text
        presentAlert(btnPressed: "BTC")
    }
    @IBAction func ethButtonPressed(_ sender: Any) {
        UIPasteboard.general.string = ethAddressOutlet.text
        presentAlert(btnPressed: "ETH")
    }
    @IBAction func adaButtonPressed(_ sender: Any) {
        UIPasteboard.general.string = adaAddressOutlet.text
        presentAlert(btnPressed: "ADA")
    }
    @IBAction func dogeButtonPressed(_ sender: Any) {
        UIPasteboard.general.string = dogeAddressOutlet.text
        presentAlert(btnPressed: "DOGE")
    }
    
    // alert
    func presentAlert(btnPressed: String) {
        let alert = UIAlertController(title: "Copied!", message: "\(btnPressed) address has been copied to your clipboard.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}

