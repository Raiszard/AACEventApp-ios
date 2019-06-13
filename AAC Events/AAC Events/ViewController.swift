//
//  ViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/2/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import OneSignal
import SafariServices

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
    private var alertView: UIAlertController!

    @IBAction func unlockButtonTapped(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate

        if appD.privacyPolicyAccepted {
            if unlockField.text?.uppercased() == "AFGAM19" {
                appD.isAppUnlocked = true
                UserDefaults.standard.set("SIARISJAIT", forKey: "isUnlocked")
                presentMainStoryBoard()

            }
        } else {
            //present alert view controller
            let title = "Privacy Policy"
            let message = "In order to use the app, please review and accept the privacy policy"

            if UIDevice.current.userInterfaceIdiom == .pad {
                alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alertView.popoverPresentationController?.sourceRect = skipButton.frame
                alertView.popoverPresentationController?.sourceView = skipButton
            } else {
                alertView = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            }
            
            alertView.addAction(UIAlertAction(title: "Accept", style: .default, handler: { (action) in
                appD.privacyPolicyAccepted = true
                UserDefaults.standard.set(true, forKey: "privacyAccepted")
                OneSignal.consentGranted(true);
                appD.initOneSignalSDK()
                
                if self.unlockField.text?.uppercased() == "AFGAM19" {
                    appD.isAppUnlocked = true
                    UserDefaults.standard.set("SIARISJAIT", forKey: "isUnlocked")
                    self.presentMainStoryBoard()
                }
            }))
            alertView.addAction(UIAlertAction(title: "Read Privacy Policy", style: .cancel, handler: { (action) in
                let urlString = "https://www.afghanamericanconference.org/mobile-app-privacy-policy"
                let url = URL(string: urlString)
                let svc = SFSafariViewController(url: url!)
                self.present(svc, animated: true, completion: nil)
            }))
            alertView.addAction(UIAlertAction(title: "Decline", style: .destructive, handler: { ( action) in
                self.alertView.dismiss(animated: true, completion: nil)
            }))
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
        
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


        if !appD.privacyPolicyAccepted {
            //present alert view controller
            let title = "Privacy Policy"
            let message = "In order to use the app, please review and accept the privacy policy"
            if UIDevice.current.userInterfaceIdiom == .pad {
                alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alertView.popoverPresentationController?.sourceRect = skipButton.frame
                alertView.popoverPresentationController?.sourceView = skipButton
            } else {
                alertView = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            }

            alertView.addAction(UIAlertAction(title: "Accept", style: .default, handler: { (action) in
                appD.privacyPolicyAccepted = true
                UserDefaults.standard.set(true, forKey: "privacyAccepted")
                OneSignal.consentGranted(true);
                appD.initOneSignalSDK()
                self.presentMainStoryBoard()
            }))
            alertView.addAction(UIAlertAction(title: "Read Privacy Policy", style: .default, handler: { (action) in
                let urlString = "https://www.afghanamericanconference.org/mobile-app-privacy-policy"
                let url = URL(string: urlString)
                let svc = SFSafariViewController(url: url!)
                self.present(svc, animated: true, completion: nil)
            }))
            alertView.addAction(UIAlertAction(title: "Decline", style: .destructive, handler: { ( action) in
                self.alertView.dismiss(animated: true, completion: nil)
            }))
            self.present(alertView, animated: true, completion: nil)
        } else {
            self.presentMainStoryBoard()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.unlockField.endEditing(true)
        return false
    }
}

