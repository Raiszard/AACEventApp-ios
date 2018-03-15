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
    
    let aacMenus = ["About", "Planning Team", "Donate", "FAQ", "Credits"]
    let menuItems =  ["Agenda", "Cohorts", "Sponsors", "Norms", "Speakers", "Attendees", "Initiatives", "Conference Evaluation"]

    @IBOutlet weak var tableView: UITableView!

    override var prefersStatusBarHidden: Bool {
        return false
    }

	var isAppUnlocked: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

		let appD = UIApplication.shared.delegate as! AppDelegate
		isAppUnlocked = appD.isAppUnlocked

        
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
        position.x = view.center.x/2 + 20
        imageV.center = position
        tableView.tableHeaderView = view
        
        
    }
    
}

/*
 Extention of `NavigationMenuViewController` class, implements table view delegates methods.
 */
extension NavigationMenuViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isAppUnlocked {
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
		
		let bgColorView = UIView()
		bgColorView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
		cell.selectedBackgroundView = bgColorView
		cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
		cell.textLabel?.textColor = .white

        if isAppUnlocked {
            if indexPath.section == 0 {
                cell.textLabel?.text = aacMenus[indexPath.row]
            }
            if indexPath.section == 1 {
				let menuText = "     " + menuItems[indexPath.row]
                cell.textLabel?.text = menuText
				cell.textLabel?.textColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
				cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: 16)

				
            }
        } else {
            cell.textLabel?.text = aacMenus[indexPath.row]
        }

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
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 0 { return 0.0 }
		return 30.0
	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if section == 0 { return nil }
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
		let label = UILabel(frame: CGRect(x: 15, y: 0, width: 175, height: 30))
		label.text = "AAC 2018"
		label.font = UIFont(name: "Avenir-Medium", size: 18)
		label.textColor = .white

		view.addSubview(label)
		return view
	}
}
