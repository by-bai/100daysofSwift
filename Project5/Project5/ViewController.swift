//
//  ViewController.swift
//  Project5
//
//  Created by Bai on 1/6/21.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") { //takes in name and path extension, returns a String? -> get the path back or nil if it didn't exist
            if let startWords = try? String(contentsOf: startWordsURL) { //load file into a single string and split into an array fo strings based on line break
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        //try? -> call this code, and if it throws an error just send back nil instead
        
        if allWords.isEmpty { // same as allWords.count == 0 but isEmpty is more efficient
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement() // choose one random item from all strings -- generate word for player to work with
        usedWords.removeAll(keepingCapacity: true) //remove all values from used array
        tableView.reloadData() //reload all its sections and rows from scratch
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }


}

