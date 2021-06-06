//
//  ViewController.swift
//  Project6B
//
//  Created by Bai on 6/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = .red
        label1.text = "red"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .cyan
        label2.text = "cyan"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = .yellow
        label3.text = "yellow"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = .green
        label4.text = "green"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = .orange
        label5.text = "orange"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        for label in viewsDictionary.keys {
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
            
        /* view = main view for viewcontroller
         * addConstraints add an array of constraints to the view
         * NSLayoutConstraint is the auto layout method that converts VFL into an array of constraints
         * Visual Format Language H:|[label1]| gets converted into auto layout constraints then added to the view horizontally label goes to the edge of my view
             * H: horizontal layout
             * |: edge of the view (view controller)
             * [label1] "put label 1 here" ; imagine [ ] as the edges of the view
         */
        }
        
        // let metrics = ["labelHeight": 88]
        
        // view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        
        // - is space, 10pts by default, can be customised
        // constant priority is a value between 1 and 1000. 1000 means "this is absolutely required" and anything less is optional. making priority 999 makes the height optional - so auto layout can find a solution to the layout by shrinking the labels to make them fit. making 88pt optional - auto layout might make them arnd 78 (do its best to make them as close to 88 as possible)
        
        /* Anchors
         
         widthAnchor, heightAnchor, topAnchor, bottomAnchor, leftAnchor, rightAnchor, leadingAnchor, trailingAnchor, centerXAnchor, and centerYAnchor.
         
         Read left to right
         * left=leading
         * right=trailing
         
         */
        
        var previous: UILabel? //first time the loop goes around, there is no previous label
        //set it to the current item so that the next label can refer to it
        
        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true //same width as main view
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true //height = 88
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = label 
        }
        
    }


}

