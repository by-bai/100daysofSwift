//
//  DetailViewController.swift
//  Project1
//
//  Created by Bai on 18/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView! // implicitly unwrapped optional. it starts its life as nil, then gets set a value before we use it.
    // when the detail view controller is created, its view hasn't been loaded yet - it's just some code running on the CPU. when the basic stuff has been done (e.g. allocating enough memory to hold it), iOS goes ahead and loads the layout from the storyboard, then connects all the outlets from the storyboard to code.
    
    var selectedImage: String? // optional string - might have a value or not. use if let to check that selectedImage has a value, and if so pull out for usage, otherwise do nothing.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage //dont need to unwrap because both are optional strings.
        
        navigationItem.largeTitleDisplayMode = .never //if not by default will inherit the large title from the main screen

        // Do any additional setup after loading the view.
        
        // load image into the image view in DetailViewController
        // UIImage is the data type for loading image data PNGs/JPEGs
        // UIImage takes in parameter named (name of image to load) -> looks for this filename in app's bundle
        
        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    /*
     viewDidLoad() - called when the view controller's layout has been loaded
     viewWillAppear() - about to be shown
     viewDidAppear() - has been shown
     viewWillDisappear() - about to go away
     viewDidDisappear() - has gone away
     */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
