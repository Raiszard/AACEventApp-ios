//
//  PersonTableViewCell.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/14/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit


class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
