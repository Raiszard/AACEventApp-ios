//
//  InitiativeDetailsViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 3/1/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class InitiativeDetailsViewController: UIViewController {
    

    
    
    @IBOutlet weak var lineViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var initiativeTextDetails: UITextView!
    @IBOutlet weak var initiativeLabel: UILabel!
    @IBOutlet weak var headerContainer: UIView!
    
    var initiativeName: String! = ""
    var initiativeDescription: String! = ""
    var mainHeaderImage : UIImage = UIImage(named: "aaconnectHeader")!

    
    @IBAction func backPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil )

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        initiativeTextDetails.text = initiativeDescription
        initiativeLabel.text = initiativeName
 
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lineViewHeightConstraint.constant = 0.5
        view.backgroundColor = .white
    }
    
    var scrolledOnce = false
    override func viewDidAppear(_ animated: Bool) {
        if !scrolledOnce {
            initiativeTextDetails.setContentOffset(CGPoint.zero, animated: false)
            
            scrolledOnce = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = mainHeaderImage
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "", subtitle:nil, imageURL: nil, image: headerImage, isProfile: true)
        
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
