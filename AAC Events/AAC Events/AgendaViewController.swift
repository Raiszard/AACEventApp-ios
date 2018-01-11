//
//  AgendaViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/10/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class AgendaViewController: UIViewController {

    @IBOutlet weak var daysSegmentedControl: UISegmentedControl!
    @IBOutlet weak var selectedBarCenterOffsetConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        daysSegmentedControl.backgroundColor = .clear
        daysSegmentedControl.tintColor = .clear
        
        let attributes: [NSAttributedStringKey: Any] = [ NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
//        let titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, forState: .Selected)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dayChanged(_ sender: UISegmentedControl) {
        
        let segmentWidth = daysSegmentedControl.frame.width / 3
        
        var offset = CGFloat(0.0)
        switch sender.selectedSegmentIndex {
        case 0:
            offset = (segmentWidth * -1)
        case 1: offset = 0
        case 2: offset = segmentWidth
        default:
            print("SHOULD NEVER SEE THIS")
        }
        self.selectedBarCenterOffsetConstraint.constant = offset

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func openMenu(_ sender: UIButton) {
        
        if let menuItemViewController = self.tabBarController as? SideMenuItemContent {
            menuItemViewController.showSideMenu()
        }
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
