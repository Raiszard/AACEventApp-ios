//
//  ViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/2/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var unlockButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        unlockButton.layer.cornerRadius = 10

    }
    @IBOutlet weak var unlockField: UITextField!
    @IBAction func unlockButtonTapped(_ sender: Any) {
        
        if unlockField.text?.uppercased() == "AFGAM18" {
            let appD = UIApplication.shared.delegate as! AppDelegate
            appD.isAppUnlocked = true
            UserDefaults.standard.set("SIARISJAIT", forKey: "isUnlocked")
            presentMainStoryBoard()

        } else {
            //present alert view controller
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let appD = UIApplication.shared.delegate as! AppDelegate
        if appD.isAppUnlocked {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(250), execute: {
                self.presentMainStoryBoard()
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentMainStoryBoard() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        present(vc, animated: true, completion: nil)

    }
    
    @IBAction func skipTapped(_ sender: Any) {
		
		let appD = UIApplication.shared.delegate as! AppDelegate
		appD.isAppUnlocked = false
		UserDefaults.standard.set(nil, forKey: "isUnlocked")

        presentMainStoryBoard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.unlockField.endEditing(true)
        return false
    }
}

