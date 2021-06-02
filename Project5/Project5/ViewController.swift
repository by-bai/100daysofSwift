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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
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
    
    @objc func promptForAnswer() { // called by UIBarButtonItem - requires @objc
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        
        ac.addTextField() //add UITextField
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { //trailing closure syntax
            [weak self, weak ac] _ in //input into the closure; capture weakly
            guard let answer = ac?.textFields?[0].text else { return } //UITextField -- safely unwrap the array of text fields - it's optional because there might not be any.
            self?.submit(answer) // pulls out the text from the text field and passes it to submit() method
        }
        
        //giving UIAlertAction some code to execute when it's tapped, and it wants to know that that code accepts a parameter of type UIAlertAction
        //in keyword -> everything before that describes the closure, everything after that is the closure
        //[weak self, weak ac] action in : can replace action with _ (leave parameter unnamed if we dont make any reference to the parameter inside the closure)
        //weak self -> current view controller
        //weak ac -> UIAlertController
        //closure can use self and ac but won't create a strong reference cycle
        //Inside the closure we need to reference methods on our view controller using self so that we’re clearly acknowledging the possibility of a strong reference cycle.
        
        ac.addAction(submitAction) //add UIAlertAction
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        let errorTitle: String
        let errorMessage: String
        
        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(answer, at: 0) //insert into array at position 0 - new entry goes on top
                    
                    let indexPath = IndexPath(row: 0, section: 0) // insert a new role in the table view. 0 0 - top of the table
                    tableView.insertRows(at: [indexPath], with: .automatic) // insertRows() animates the new cell appearing. with parameter -> animation
                    //IndexPath contains section and row for every item in table
                    return // exit method
                } else {
                    errorTitle = "Word not recognised"
                    errorMessage = "You can't just make them up, you know!"
                }
            } else {
                errorTitle = "Word already used"
                errorMessage = "Be more original!"
            }
        } else {
            guard let title = title?.lowercased() else { return }
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title)."
        }
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word) //if not inside usedWords array, returns true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }

}

