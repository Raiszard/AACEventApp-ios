//
//  AttendeeTableViewCell.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/7/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class AttendeeTableViewCell: UITableViewCell {

    @IBOutlet weak var confambImage: UIImageView!
    //@IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
