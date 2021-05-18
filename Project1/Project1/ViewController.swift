//
//  ViewController.swift
//  Project1
//
//  Created by Bai on 17/5/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]() // create an array of all the "nssl" pictures for reference later. pictures array is a property of ViewController which will be created when ViewController screen is created, and exist for as long as the screen exists.
    
    override func viewDidLoad() { // override: change Apple's default behaviour from UIViewController
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default // data type that works with the file system - use it to look for files
        let path = Bundle.main.resourcePath! // resource path of app's bundle. bundle is a directory containing the compiled program and all assets. "tell me where i can find all those images i added to my app"
        let items = try! fm.contentsOfDirectory(atPath: path) // contents of the directory at a path. items constant will be an array of strings containing filenames
        
        // * fm, path and items constants live inside the method viewDidLoad() and will be destroyed as soon as the method finishes.
        
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
            }
            
        }
        
        print(pictures)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    // tableView: UITableView -> the table view that triggered the code. tableView is the name that we can use to reference the table view inside the method, UITableView is the data type.
    // numberOfRowsInSection section: Int -> iOS wants to know how many rows are in the table view. table views can be split into sections, like the way the Contacts app separates names by first letter. this method must return an integer.
    // _ means it doesn't need to have a name sent externally, because it's the same as the method name.
    
    
    // specify what each row should look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    // cellForRowAt called when you need to provide a row. the row to show is indexPath of type IndexPath, a data type that contains both section number and a row number.
    // -> UITableViewCell must return a table view cell.
    // dequeueReusableCell recycles existing cells
    // cell has a property called textLabel which is optional "do this only if there is an actual text label there, or do nothing otherwise"
    


}

