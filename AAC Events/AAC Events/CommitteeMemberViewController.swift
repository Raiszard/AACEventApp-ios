//
//  CommitteeMemberViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 2/15/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit


class CommitteeMemberViewController: UIViewController {

    @IBOutlet weak var committeeImage: UIImageView!
    @IBOutlet weak var headerContainer: UIView!
    
    @IBOutlet weak var commiteePersonTextView: UITextView!
    var name: String! = ""
    var personTitle: String! = ""
    var personDescription: String! = ""
    //var passedImage : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        commiteePersonTextView.text = personDescription
        
        self.committeeImage.image =  UIImage(named: name)
        
        setupHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        committeeImage.layer.cornerRadius = 120/2
        committeeImage.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil )
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            commiteePersonTextView.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "committeeHeader2")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: name, subtitle:personTitle, imageURL: nil, image: headerImage, isProfile: true)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
