//
//  ViewController.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/2/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    @IBAction func facebookTapped(_ sender: Any) {
        
    }
    
    @IBAction func skipTapped(_ sender: Any) {
        
        presentMainStoryBoard()
    }
    
}

