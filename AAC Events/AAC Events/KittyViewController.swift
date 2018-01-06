//
// KittyViewController.swift
//
// Copyright 2017 Handsome LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import InteractiveSideMenu

/*
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class KittyViewController: UIViewController, SideMenuItemContent {
    @IBOutlet weak var headerContainer: UIView!
    
    /* Show side menu on menu button click
     */
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testImage = UIImage(named: "tempLogo")
        let header: ViewHeader = .fromNib()

        let hView = header.createHeader(title: "Agenda", subtitle:nil, imageURL: nil, image: nil, isProfile: false)

        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
    }
}
