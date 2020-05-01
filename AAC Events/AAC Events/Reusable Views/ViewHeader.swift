//
//  ViewHeader.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/5/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import SDWebImage

class ViewHeader: UIView {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    //determines if the titles should be centered
    //true: center alignment, false: left
    var isProfile: Bool!

    func createHeader(title: String, subtitle: String?, imageURL: String?, image: UIImage?, isProfile: Bool!) -> UIView {
        
        if subtitle != nil && !subtitle!.isEmpty {
            headerLabel.isHidden = true
            titleLabel.isHidden = false
            subTitleLabel.isHidden = false
            
            titleLabel.text = title
            subTitleLabel.text = subtitle!
            
            if isProfile {
                titleLabel.textAlignment = .center
                subTitleLabel.textAlignment = .center
            } else {
                titleLabel.textAlignment = .left
                subTitleLabel.textAlignment = .left
            }
        } else {
            headerLabel.isHidden = false
            titleLabel.isHidden = true
            subTitleLabel.isHidden = true
            
            headerLabel.text = title

        }
        
        if imageURL != nil && image == nil {
            let url = URL(string: imageURL!)
            headerImage.sd_setImage(with: url, completed: nil)
            
        } else if image != nil {
            headerImage.image = image
        } else {
            print("INVALID IMAGE SENT TO ViewHeader")
        }
        
        return self
    }

    
}
extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
