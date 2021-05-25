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
    
    var detailTitleBar: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = detailTitleBar //dont need to unwrap because both are optional strings.
        
        navigationItem.largeTitleDisplayMode = .never //if not by default will inherit the large title from the main screen
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        //when tapped, call the shareTapped() method
        //method belongs to the current view controller ("self")
        //"#selector" -> tells SWift compiler that a method called "shareTapped" will exist, and should be triggered when the button is tapped
        

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
    
    @objc func shareTapped() {
        guard let image = ImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        if let imageName = selectedImage {
            let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: []) //array of items you want to share and array of any of your own app's services you want to make sure are in the list
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
        }
    
    }
    //"@obj" because this method gets called by the underlying Objective-C operating system (the UIBarButtonItem) so we need to mark it as being available to Objective-C code
    //image view may or may not have an image inside -- read it out safely
    //compression quality = 1.0 (max), 0.0 (min)
    //create UIActivityViewController for sharing content with other apps and services
    //anchor to rightbarbutton item for iPad
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
