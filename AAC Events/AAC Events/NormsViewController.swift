//
//  NormsViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 1/10/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage

class NormsViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var headerContainer: UIView!
    
    @IBOutlet weak var textView: UITextView!
    
    var activityIndicator: UIActivityIndicatorView!
    var api: API!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.color = .black
        
        activityIndicator.center = view.center
        
        api = API()
        
        setupHeader()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNorms()

    }
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "normsHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Norms", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
    }

    func getNorms() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        api.retrieveNorms { (attrString) in
            guard let check = attrString else {
                print("error downloading norms")
                //TODO: show alert
                return
            }
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.textView.attributedText = check
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
