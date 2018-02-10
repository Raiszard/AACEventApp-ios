//
//  SponsorViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 1/10/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage

class SponsorViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerContainer: UIView!
    
    var sponsorLevel: [String] = ["Diamond", "Platinum", "Gold", "Silver", "Lapis" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "sponsorHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "Sponsors", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
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

extension SponsorViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sponsorLevel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 //SIAR TO UPDATE CODE: we need to make this conditional based on the number of items for each sponsor level in the json data
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sponsorLevel[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sponsorCell", for: indexPath)
        
        
        //cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
}
