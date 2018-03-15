//
//  ImageLabelTableViewCell.swift
//  AAC Events
//
//  Created by Mohammad Noorzay on 3/14/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class ImageLabelTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
