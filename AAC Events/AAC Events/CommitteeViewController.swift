//
//  CommitteeViewController.swift
//  AAC Events
//
//  Created by Omar M. Noorzay on 2/14/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import SDWebImage

class CommitteeViewController: UIViewController, SideMenuItemContent {
    @IBOutlet weak var headerContainer: UIView!

    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()

    }
    
    @IBOutlet weak var tableView: UITableView!
    

    
    
    
 
    
    

    

    
    let execNameArray: [String] = ["Zachia Nazarzai"]
    let execTitleArray: [String] = ["Executive Committee, Director"]
    let execDescriptionArray: [String] =
        [    "Growing up, Zachia was surrounded by a large Afghan community in Southern California. However, it was upon joining the United Afghan Club at UCLA that she first started working with the community, and she has not stopped since. Zachia is driven by the strength of her community and hopes the Afghan-American Conference will serve as a space for the community to learn from and work with one another.\n\nZachia is the Director for International Relations, Policy, & Protocol for Los Angeles Mayor Eric Garcetti. She received her BA in International Development Studies and Political Science from UCLA and her Masters in Public Policy and Management from Carnegie Mellon University."
    ]
 //   let execImageArray: [UIImage] = [
 //       UIImage(named: "committeeHeader")!
  //      ]
    
    let marketingNameArray: [String] = ["Omed Amin"]
    let marketingTitleArray: [String] = ["Marketing Director"]
    let marketingDescriptionArray: [String] =
        [
            "TEST"
            ]
 //   let marketingImageArray: [UIImage] = [
     //   UIImage(named: "committeeHeader")!
   //     ]
    
    let opsNameArray: [String] = ["Darya Moini"]
    let opsTitleArray: [String] = ["Operations Director"]
    let opsDescriptionArray: [String] =
        [
            "TEST"
            ]
   // let opsImageArray: [UIImage] = [
  //      UIImage(named: "committeeHeader")!
   //     ]
    
    let programmingNameArray: [String] = ["Yosef Mahmood"]
    let programmingTitleArray: [String] = ["Programming Director"]
    let programmingDescriptionArray: [String] =
        [
            "TEST"
            ]
  //  let programmingImageArray: [UIImage] = [
   //     UIImage(named: "committeeHeader")!
   //     ]
    
    let subNameArray: [String] = ["Hila Hamidi"]
    let subTitleArray: [String] = ["Marketing - Video Content Creator"]
    let subDescriptionArray: [String] =
        [
            "TEST"
            ]
   // let subImageArray: [UIImage] = [
     //   UIImage(named: "committeeHeader")!
     //   ]
    

    let bodNameArray: [String] = ["Mohammad Ali Azizi-Sultan"]
    let bodTitleArray: [String] = ["AACO Board"]
    let bodDescriptionArray: [String] =
        [
            "TEST"
            ]
   // let bodImageArray: [UIImage] = [
   //     UIImage(named: "committeeHeader")!
    //    ]
    
    let ccNameArray: [String] = ["Alexandra Millatmal"]
    let ccTitleArray: [String] = ["Code of Conduct Coordinator"]
    let ccDescriptionArray: [String] =
    ["CC"]
   /// let ccImageArray: [UIImage] = [
      //  UIImage(named: "committeeHeader")!
   //     ]
    
    let mhNameArray: [String] = ["Nilo Sidiqi"]
    let mhTitleArray: [String] = ["Mental Health Advisor"]
    let mhDescriptionArray: [String] =
    ["mh"]
   // let mhImageArray: [UIImage] = [
    //    UIImage(named: "committeeHeader")!
    //    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        
        //TODO: create name array
        //TODO: create name subtitle array
        //TODO: person description
        



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHeader() {
        
        let headerImage = UIImage(named: "committeeHeader")
        let header: ViewHeader = .fromNib()
        
        let hView = header.createHeader(title: "", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
        hView.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.addSubview(hView)
        
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .top, relatedBy: .equal, toItem: headerContainer, attribute: .top, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: hView, attribute: .leading, relatedBy: .equal, toItem: headerContainer, attribute: .leading, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .bottom, relatedBy: .equal, toItem: hView, attribute: .bottom, multiplier: 1.0, constant: 0))
        headerContainer.addConstraint(NSLayoutConstraint(item: headerContainer, attribute: .trailing, relatedBy: .equal, toItem: hView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
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

extension CommitteeViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return execNameArray.count//13
        case 2:
            return marketingNameArray.count
        case 3:
            return opsNameArray.count
        case 4:
            return programmingNameArray.count
        case 5:
            return subNameArray.count
        case 6:
            return bodNameArray.count
        case 7:
            return ccNameArray.count
        default:
            return mhNameArray.count
        }
    }

    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if (section == 0){
            return ""
        }
        else if section == 1 {
            return "Organizing Committee"
        }
        return "Subcommittee"
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 15)
        
        label.text = "Test"
        
        if (section == 0){
            label.text = ""
        }
        else if section == 1 {
            label.text = "Committee - Executive Team"
        }
        else if section == 2 {
            label.text = "Committee - Marketing Team"
        }
        else if section == 3 {
            label.text = "Committee - Operations Team"
        }
        else if section == 4 {
            label.text = "Committee - Programming Team"
        }
        else if section == 5 {
            label.text = "Sub-Committee"
        }
        else if section == 6 {
            label.text = "Board of Directors"
        }
        else if section == 7 {
            label.text = "Conduct Coordinators"
        }
        else {
           label.text = "Mental Health Advisors"
        }
        label.backgroundColor = .white
        return label

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as? CommitteeDescriptionCell else {
                return UITableViewCell()
            }
            
            cell.committeeDescription.text = "The Afghan-American Conference started as an idea implemented by a group of 8 students and working professionals volunteering remotely from across the United States. After scaling beyond the conference to a non-profit with various focus areas,  AACO, our team has also scaled. Today, the AACO Team is composed of 19 Committee Members across four committees, 8 Board of Directors, and 3 Code of Conduct Coordinators. The four committees include the Executive, Conference, Marketing, and Academic & Professional Development Committees.\n\nOur team comprises diverse individuals who hold a deep passion for our community, a commitment to service, and unique personal and professional experiences, to which all of whom seek to advance AACO's vision of building a supportive, empowered, and engaged Afghan-American community.\n"
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "committeeCell") as? CommitteePersonCell else {
            return UITableViewCell()
        }
        
        var name: String = ""
        var title: String = ""
        
        if indexPath.section == 1 {
           name = execNameArray[indexPath.row]
            title = execTitleArray[indexPath.row]
        } else if indexPath.section == 2 {
            name = marketingNameArray[indexPath.row]
            title = marketingTitleArray[indexPath.row]
        }
        else if indexPath.section == 3 {
            name = opsNameArray[indexPath.row]
            title = opsTitleArray[indexPath.row]
        }
        else if indexPath.section == 4 {
            name = programmingNameArray[indexPath.row]
            title = programmingTitleArray[indexPath.row]
        }
        else if indexPath.section == 5 {
            name = subNameArray[indexPath.row]
            title = subTitleArray[indexPath.row]
        }
        
        else if indexPath.section == 6 {
            name = bodNameArray[indexPath.row]
            title = bodTitleArray[indexPath.row]
        }
        else if indexPath.section == 7 {
            name = ccNameArray[indexPath.row]
            title = ccTitleArray[indexPath.row]
        }
        else if indexPath.section == 8 {
            name = mhNameArray[indexPath.row]
            title = mhTitleArray[indexPath.row]
        }
        
        cell.titleLabel.text = title
        cell.nameLabel.text = name
        
        return cell
    }
    
    


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "CommitteeMember") as! CommitteeMemberViewController
        
        var name: String = ""
        var title: String = ""
        var descp: String = ""
   //     var pic : [UIImage] = []
        
         if indexPath.section == 1 {
             name = execNameArray[indexPath.row]
             title = execTitleArray[indexPath.row]
             descp = execDescriptionArray[indexPath.row]
  //           pic = execImageArray[indexPath.row]
         } else if indexPath.section == 2 {
             name = marketingNameArray[indexPath.row]
             title = marketingTitleArray[indexPath.row]
         descp = marketingDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 3 {
             name = opsNameArray[indexPath.row]
             title = opsTitleArray[indexPath.row]
         descp = opsDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 4 {
             name = programmingNameArray[indexPath.row]
             title = programmingTitleArray[indexPath.row]
         descp = programmingDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 5 {
             name = subNameArray[indexPath.row]
             title = subTitleArray[indexPath.row]
         descp = subDescriptionArray[indexPath.row]
         }
        
         else if indexPath.section == 6 {
             name = bodNameArray[indexPath.row]
             title = bodTitleArray[indexPath.row]
         descp = bodDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 7 {
             name = ccNameArray[indexPath.row]
             title = ccTitleArray[indexPath.row]
         descp = ccDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 8 {
             name = mhNameArray[indexPath.row]
             title = mhTitleArray[indexPath.row]
         descp = mhDescriptionArray[indexPath.row]
         }
        
        
        destination.name = name
        destination.personTitle = title
        destination.personDescription = descp
        destination.modalPresentationStyle = .fullScreen

        present(destination, animated: true, completion: nil)
        
        tableView.cellForRow(at: indexPath)?.isSelected = false
 
    }
}

class CommitteeDescriptionCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var committeeDescription: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class CommitteePersonCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
