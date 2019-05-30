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
import MessageUI

/*
 Menu controller is responsible for creating its content and showing/hiding menu using 'menuContainerViewController' property.
 */
class NavigationMenuViewController: MenuViewController {

    let kCellReuseIdentifier = "MenuCell"
    
    let aacMenus = ["About", "Planning Team", "Donate", "FAQ"]
    let menuItems =  ["Norms", "Agenda", "Speakers", "Cohorts", "Attendees", "AACare Team",  "Sponsors", "Initiatives", "Conference Evaluation"]

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
        position.x = view.center.x/2 + 10
        imageV.center = position
        tableView.tableHeaderView = view
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        
        let contactUsButton = UIButton(frame: CGRect(x: 0, y: 10, width: 100, height: 44))
        contactUsButton.setTitle("Contact Us", for: .normal)
        contactUsButton.backgroundColor = .black
        contactUsButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        contactUsButton.addTarget(self, action:#selector(contactUsButtonTapped), for: .touchUpInside)
        
        let creditButton = UIButton(frame: CGRect(x: 0, y: 40 , width: 100, height: 44))
        creditButton.backgroundColor = .black
        creditButton.setTitle("Credits", for: .normal)
        creditButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        creditButton.addTarget(self, action:#selector(creditButtonTapped), for: .touchUpInside)

        contactUsButton.center.x = position.x
        creditButton.center.x = position.x
        
        footerView.addSubview(contactUsButton)
        footerView.addSubview(creditButton)
        
        tableView.tableFooterView = footerView
        
        
    }
    
    @objc func creditButtonTapped() {
        print("credit tapped")
//        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T

        let creditVC =  self.storyboard?.instantiateViewController(withIdentifier: "Credits") as! CreditsViewController
        menuContainerViewController!.selectContentViewController(creditVC)
        menuContainerViewController!.hideSideMenu()
        
    }
    
    @objc func contactUsButtonTapped() {
        print("contactUsButtonTapped")
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }

    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["afghanamericanconference@gmail.com"])
//        mailComposerVC.setSubject("")
//        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
}

extension NavigationMenuViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
		label.text = "AAC 2019"
		label.font = UIFont(name: "Avenir-Medium", size: 18)
		label.textColor = .white

		view.addSubview(label)
		return view
	}
}
