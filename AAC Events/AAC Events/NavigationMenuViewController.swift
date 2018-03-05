//
// NavigationMenuViewController.swift
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
 Menu controller is responsible for creating its content and showing/hiding menu using 'menuContainerViewController' property.
 */
class NavigationMenuViewController: MenuViewController {

    let kCellReuseIdentifier = "MenuCell"
    
    let aacMenus = ["About", "Planning Team", "Donate", "FAQ"]
    let menuItems =  ["Agenda", "Cohorts", "Sponsor", "Norms", "Speakers", "Attendees", "Initiatives", "Conference Evaluation"]

    @IBOutlet weak var tableView: UITableView!

    override var prefersStatusBarHidden: Bool {
        return false
    }

    var isAppUnlocked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Select the initial row
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableViewScrollPosition.none)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200))
        view.backgroundColor = .black
        let imageV = UIImageView(image: UIImage(named: "sideMenuLogo"))
        imageV.layer.cornerRadius = imageV.frame.size.width/2
        imageV.contentMode = .scaleAspectFit
        imageV.clipsToBounds = true
        view.addSubview(imageV)
        var position = view.center
        position.x = view.center.x/2
        imageV.center = position
        tableView.tableHeaderView = view
        
        
    }
    
}

/*
 Extention of `NavigationMenuViewController` class, implements table view delegates methods.
 */
extension NavigationMenuViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isAppUnlocked { //TODO: use the unlock bool from appD
            return 2
        }
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if isAppUnlocked {
            if section == 0 {
                return aacMenus.count
            } else if section == 1 {
                return menuItems.count
            }
        }
        return aacMenus.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellReuseIdentifier, for: indexPath)
        
        if isAppUnlocked {
            if indexPath.section == 0 {
                cell.textLabel?.text = aacMenus[indexPath.row]
            }
            if indexPath.section == 1 {
                cell.textLabel?.text = menuItems[indexPath.row]
            }
        } else {
            cell.textLabel?.text = aacMenus[indexPath.row]
        }
        cell.textLabel?.textColor = .white

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        var adjustedPath = indexPath
        //adjust index
        if isAppUnlocked {
            if indexPath.section == 1 {
                adjustedPath.row = indexPath.row + aacMenus.count
            }
        }

        menuContainerViewController.selectContentViewController(menuContainerViewController.contentViewControllers[adjustedPath.row])
        menuContainerViewController.hideSideMenu()
    }
}
