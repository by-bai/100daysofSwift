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
    
    var selectedImage: String? // optional string
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
