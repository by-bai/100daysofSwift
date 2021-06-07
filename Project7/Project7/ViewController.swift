//
//  ViewController.swift
//  Project7
//
//  Created by Bai on 7/6/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we're OK to parse!
                parse(json: data)
                print("ok")
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            print(petitions)
            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print(petitions.count)
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        print(cell)
        let petition = petitions[indexPath.row]
        print(petitions)
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }

}

