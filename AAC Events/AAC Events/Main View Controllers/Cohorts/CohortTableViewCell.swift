//
//  CohortTableViewCell.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/13/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class CohortTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
