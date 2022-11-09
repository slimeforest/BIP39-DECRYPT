//
//  ViewController.swift
//  DECRYPTo
//
//  Created by Jack Battle on 11/2/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    // outlets
    @IBOutlet weak var decryptoLabelOutlet: UILabel!
    
//    let btcAddress = "bc1pmm7htgzphh8e2n8j8ghrqhg5j66mc6z6kqupp7e5xnlpu8zp0v4qyhwn8w"
//    let ethAddress = "0xe6FDE716da7853cCa69696A4c9264AE0C0ac1574"
//    let adaAddress = "addr1qxceekr0c2vnv3esdzzxaee4xk9fv2katnuclhfdz87sl84rkn6apwfxe2whv3wasec3hcqyf433h2t2ms7hves3gppqr4dzqc"
//    let dogeAddress = "DJYhUxw4isHWuCQU3fKkgWwuSz2qfeBC8d"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        configMenu()
        
        
    }
    
    
    @IBAction func viewCodePressed(_ sender: Any) {
        if let url = URL(string: "https://github.com/slimeforest/BIP39-DECRYPT") {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = false

                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
    }
    
//    @IBOutlet weak var addressButtonOutlet: UIBarButtonItem!
    
//
//    func configMenu() {
//        var menuItems: [UIAction] {
//            return [
//                UIAction(title: "Copy BTC address", image: UIImage(systemName: "sun.max"), handler: { (_) in
//                    print("BTC Pressed.")
//                    UIPasteboard.general.string = self.btcAddress
//                    self.presentAlert(btnPressed: "BTC")
//                }),
//                UIAction(title: "Copy ETH address", image: UIImage(systemName: "sun.max"), handler: { (_) in
//                    print("ETH Pressed.")
//                    UIPasteboard.general.string = self.ethAddress
//                    self.presentAlert(btnPressed: "ETH")
//                }),
//                UIAction(title: "Copy ADA address", image: UIImage(systemName: "sun.max"), handler: { (_) in
//                    print("ADA Pressed.")
//                    UIPasteboard.general.string = self.adaAddress
//                    self.presentAlert(btnPressed: "ADA")
//                }),
//                UIAction(title: "Copy DOGE address", image: UIImage(systemName: "sun.max"), handler: { (_) in
//                    print("DOGE Pressed.")
//                    UIPasteboard.general.string = self.dogeAddress
//                    self.presentAlert(btnPressed: "DOGE")
//                })
//            ]
//        }
//
//        var demoMenu: UIMenu {
//            return UIMenu(title: "Enjoying?", image: nil, identifier: nil, options: [], children: menuItems)
//        }
//
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "View Code", image: nil, primaryAction: nil, menu: demoMenu)
//
//    }
//
//    // alert
//    func presentAlert(btnPressed: String) {
//        let alert = UIAlertController(title: "Copied!", message: "\(btnPressed) address has been copied to your clipboard.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//        self.present(alert, animated: true, completion: nil)
//    }
}

