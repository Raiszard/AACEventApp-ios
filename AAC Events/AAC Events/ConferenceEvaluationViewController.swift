//
//  ConferenceEvaluationViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 3/1/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SafariServices


class ConferenceEvaluationViewController: UIViewController, SideMenuItemContent {
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func conferenceEvalPressed(_ sender: Any) {
        var urlString = "https://www.afghanamericanconference.org"
        let appD = UIApplication.shared.delegate as? AppDelegate
        if appD?.conferenceEvaluationLink != nil {
            urlString = (appD?.conferenceEvaluationLink)!
        }
        let url = URL(string: urlString)
        let svc = SFSafariViewController(url: url!)
        self.present(svc, animated: true, completion: nil)
    }
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    @IBOutlet weak var headerContainer: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        
        textView.text = "Thank you for attending to the 2019 Afghan American Conference!\n\nPlease take a few moment to share your thoughts on AAC 2019 at the end of the conference. Your feedback is very valuable to us!"


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupHeader() {
        
        let headerImage = UIImage(named: "conferenceEvalHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Conference Evaluation", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
