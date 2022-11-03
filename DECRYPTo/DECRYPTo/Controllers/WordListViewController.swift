//
//  WordListViewController.swift
//  DECRYPTo
//
//  Created by Jack Battle on 11/2/22.
//

import UIKit

class WordListViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var WordListTableView: UITableView!
    
    var list = Wordlist()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        WordListTableView.delegate = self
        WordListTableView.dataSource = self
        WordListTableView.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.wordlistDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = WordListTableView.dequeueReusableCell(withIdentifier: "bipCellReuse") as! bipCell
        
        cell.digitLabelOutlet.text = String(indexPath.row + 1)
        cell.wordLabelOutlet.text = list.wordlistArray[indexPath.row].description

        return cell
    }
}
