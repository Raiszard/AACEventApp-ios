//
//  SessionTableViewCell.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/10/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

protocol SessionCellDelegate {
    func didPressDisclosureButton(cell: SessionTableViewCell)
}

class SessionTableViewCell: UITableViewCell {

    var agendaItem: AgendaItem! {
        didSet {
            setupCell()
        }
    }

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amPMLabel: UILabel!
    
    @IBOutlet weak var sessionNameLabel: UILabel!
    @IBOutlet weak var sessionDescriptionLabel: UILabel!
    @IBOutlet weak var disclosureButton: UIButton!
    
    var delegate: SessionCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {

        timeLabel.text = agendaItem.timeString
        amPMLabel.text = agendaItem.amOrPm
        sessionNameLabel.text = agendaItem.sessionName
        sessionDescriptionLabel.text = agendaItem.sessionDescription
        
        var imageToUse = ""
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let isEnrolled = appDelegate.isEnrolledIn(sessionID: agendaItem.id)
        
        if agendaItem.isExpandable {
            if agendaItem.isExpanded {
                imageToUse = "downArrow"
            } else  {
                imageToUse = "rightArrow"
            }
        } else {
            if isEnrolled {
                imageToUse = "checkMark"
            } else {
                imageToUse = "circlePlus"
            }
        }
        
        
        disclosureButton.setImage(UIImage(named: imageToUse), for: .normal)
        disclosureButton.transform = CGAffineTransform(rotationAngle: 0)
        disclosureButton.tintColor = .black
        selectionStyle = .none
    }
    @IBAction func disclosureButtonTapped(_ sender: Any) {
        
        delegate?.didPressDisclosureButton(cell: self)
    }
    
}

