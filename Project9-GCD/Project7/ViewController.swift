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
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        DispatchQueue.global(qos:.userInitiated).async {
            //trailing closure syntax
            [weak self] in //prevent accident strong reference cycles
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    // we're OK to parse!
                    self?.parse(json: data)
                    print("ok")
                    return //returns from the closure
                }
            }
            self?.showError()
        }
        
        
    }
    
    func showError() {
        DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connectionn and try again.", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(ac, animated: true)
        }
        
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
//            print(petitions)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    //since DetailViewController isnt a view controller in the storyboard - it's a free-floating class - we don't use instantiateViewController() method to load it. use didSelectRowAt to load the class directly rather than load the user interface from a storyboard.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

