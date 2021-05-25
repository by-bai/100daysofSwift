//
//  ViewController.swift
//  Project1
//
//  Created by Bai on 17/5/21.
//

import UIKit

class ViewController: UITableViewController {
    
    // create an array of all the "nssl" pictures for reference later. pictures array is a property of ViewController which will be created when ViewController screen is created, and exist for as long as the screen exists.
    var pictures = [String]() {
        didSet {
            pictures.sort { $0 < $1 }
        }
    }

    
    override func viewDidLoad() { // override: change Apple's default behaviour from UIViewController
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    
    // show detail screen when any table row is tapped, and have it show the selected image
    
    /* 1. create property in DetailViewController to hold the name of the image to load
     2. implement didSelectRowAt method so that it loads a DetailViewController from the storyboard
     3. fill in viewDidLoad() inside DetailViewController so that it loads an image view based on the name set */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
            // storyboard ID "Detail"
            // every view controller has a property called storyboard that is either the storyboard it was loaded from or nil
            // ViewController & DetailViewController from main storyboard -> so load it from there.
            // storyboard? -> optional because Swift doesn't know we came from a storyboard.
            // if let : 3 parts of it that might fail. 1) storyboard property might be nil (? will stop the rest of the line from executing), 2) instantiateViewController might fail if given invalid storyboard ID, 3) as? might fail if receive back a view controller of a different type. if any of these things fail, the code inside if let braces wont execute. 
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its (DetailViewController's) selectedImage property to be the correct item from the pictures array
                // Swift thinks instantiateViewController will return back a UIViewController as it's the return type. therefore need to typecast -> "please try to treat this as a DetailViewController, but if it fails then do nothing and move on"
            vc.selectedImage = pictures[indexPath.row]
            vc.detailTitleBar =  "Picture \(indexPath.row + 1) of \(pictures.count)"

            // 3: now push it onto the navigation controller to display it
                // navigationController? -> view controllers also have an optional navigationController property
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

