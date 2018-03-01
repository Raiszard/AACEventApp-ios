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
    

    
    
    
 
    
    

    

    
    let orgNameArray: [String] = ["Zachia Nazarzai", "Salmon Hossein", "Yousuf Azam", "Susan Zaca", "Gina Karimi", "Homaira Hosseini", "Sara Noorzay", "Madina Salemi Nooristani", "Omar Aziz", "Sabrina Barkezai", "Samim Abedi", "Sophie Hossein", "Haroun Dada"]
    let orgTitleArray: [String] = ["Executive Director", "Executive Director", "Finance Co-Chair, Development", "Communications Chair", "Applications Chair", "Community Initiatives Chair", "Community Engagement Chair", "Finance Co-Chair", "Programming Co-Chair", "Marketing Chair", "Professional Network Chair", "Programming Co-Chair", "Logistics Chair"]
    let orgDescriptionArray: [String] =
        [    "Growing up, Zachia was surrounded by a large Afghan community in Southern California. However, it was upon joining the United Afghan Club at UCLA that she first started working with the community, and she has not stopped since. Zachia is driven by the strength of her community and hopes the Afghan-American Conference will serve as a space for the community to learn from and work with one another.\n\nZachia is a Policy Analyst on the Neighborhood Services team in Los Angeles Mayor Eric Garcetti’s Office. In her role, she works closely with the Department of Recreation and Parks and the LA Zoo. She received her BA in International Development Studies and Political Science from UCLA and her Masters in Public Policy and Management from Carnegie Mellon University.",
             
             "Salmon is passionate about volunteerism and giving back to others, and believes it is every individual’s responsibility to serve the communities they come from. Growing up around a large Afghan community, Salmon witnessed both the beautiful traits of his culture as well as the pernicious impacts of judgment and shame cast upon members of his community. He chose to embrace the good, and committed to fixing the bad. He is from Orange County, but he grew up in the Bay Area and now lives in Los Angeles.\n\nSalmon founded the United Afghan Club at UCLA, which organized Afghan College Day and fundraising banquets that have raised over $100,000 to-date for Afghanistan. In 2011, he taught a semester of English in Kabul at the American University of Afghanistan. In 2009, Prime Magazine honored him as one of “7 UCLA Bruins Who Will Change The World.” Salmon is currently an attorney at Skadden Arps. He completed his undergraduate studies at UCLA, then received a J.D. from Berkeley Law and Master of Public Administration from the Harvard Kennedy School of Government.",
             
             "Born in Afghanistan and raised in New York and California, Joseph (aka Yousuf) Azam lives in Brooklyn, NY with wife and daughter. A lawyer, writer, and voracious consumer of news and street food, Yousuf has always straddled several different worlds personally and professionally, which is why AAC and its work spoke to him. \n\nYousuf is a graduate of the University of California, Hastings College of the Law, where he served as Co-Editor-In-Chief of the Hastings International & Comparative Law Review and currently serves on the Board of Governors. He holds an M.A. in Near Eastern Studies and a B.A. in Politics & Philosophy from NYU, where his graduate work focused on Political Islam in Afghanistan. He's been a contributor for MTV News, Ethisphere Magazine, the San Francisco Chronicle, the LA Times and Lucky Peach Magazine. He's currently working with Abrams Press on an anthology of refugee stories being edited by Pulitzer prize-winning author Viet Thanh Nguyen. His contribution to that book, which will be a fundraiser for the International Rescue Committee, was inspired by his introduction to AAC in 2016.\n\nHe is currently SVP & Global Chief Compliance & Ethics Officer at Infor, where he oversees business conduct, internal investigations, and compliance. He has held similar roles at News Corp, HSBC, Accenture and Oracle, and began his legal career at Willkie Farr & Gallagher LLP in New York.",
             
             "Susan Zaca’s passion for advocating for the Afghan-American community stems from growing up in a city that was 99% Caucasian. Starting her first year at the University of California, Berkeley, she became an active member in the Afghan Student Association. She helped lead the annual ASA Culture Show fundraisers. These fundraisers raised money to provide essential supplies to Afghanistan. Susan also organized ASA’s annual winter drive, collecting winter clothing and school supplies that were sent to Afghanistan.\n\nAfter graduating in 2013 with a B.A. in Urban Studies, she moved to San Francisco where is also currently resides and is a Land Use Manager at Modus, Inc. She looks forward to working with the Afghan-American community as a member of the Organizing Committee.",
             
             "Gina Karimi’s passion for the Afghan-American community began as a child, seeing her father participate in various community events in an attempt to unite our community. In college, she was one of the leaders of ASA-West’s nationwide clothing, blankets and school supply drive for Afghanistan. She is also a board member of the Afghan Health Initiative.\n\nGina is currently a statistical analyst in Los Angeles, CA and received her M.S. in Biostatistics from UCLA. She is passionate about music and advocates for musicians and artists. She also loves memes and the Los Angeles Lakers.",
             
             "Born in Herat and raised in Fremont, Homaira from a young age has participated in fundraisers and clothing drives for Afghanistan. She has been passionate about empowering Afghans to engage civically in the U.S. She is also passionate about access to education and policy reform stem from her trips to Afghanistan visiting her family.\n\nCurrently, Homaira is a Litigation Associate at Morgan, Lewis & Bockius LLP in San Francisco. Homaira received her J.D. at the University of California, Berkeley School of Law and her B.A. in political science and public affairs from UCLA in 2009. Homaira served as the UCLA Student Body President where she focused on socially responsible investment of UCLA’s endowment and raised awareness and funds for homeless UCLA students. The University honored her by selecting her as Student Commencement Speaker. Homaira is a 2010 CORO Public Policy Fellow and 2011 Paul and Daisy Soros Fellow.",
             
             "Born in Afghanistan, but raised in the United States, Sara always felt a deep connection to her Afghan roots. Serving her community was never an option, it was a requirement. As a previous member of the Afghan American Youth Council, a non-profit organization established post-9/11, Sara worked on various programs and events focused on engaging, supporting, and empowering the Afghan-American community in Southern California. Through the years, life became busy and her involvement with the community diminished–but after attending her first AAC conference in 2015, she felt inspired and energized to re-engage in a more meaningful way. After serving as an AAC participant the last few years, Sara decided to join the AAC Organizing Committee in 2017 and take an active role in shaping the experience for future participants.\n\nSara currently resides in Los Angeles and serves as a Sr. Director of Business Systems Operation at PebblePost, a programmatic direct mail startup based in New York, with operations on the West Coast.",
             
             "Being born in Kabul, Afghanistan and witnessing first hand the sacrifices her parents made to escape the war in order to give Madina a brighter future has made her realize how privileged she is. She has tried in the past to pay it forward to future generations who may not have been as fortunate through various organizations but none inspired her like AAC.\n\nShe hopes that AAC will continue to grow and prosper so that one day, it can give her son a community to belong to, learn from, and be proud of. Madina has worked on Wall Street at AIG for the past 12 years as an Actuary. She graduated New York University, Stern School of Business with a major in Actuarial Science, Finance and minor in Mathematics.",
             
             "Omar Aziz is a proud Fremonti who grew up with Afghan soccer, Lake Elizabeth picnics, and the beautiful chaos of Afghan Sunday school. Hip-hop music and culture educated him to think critically about society, and he hopes to use the knowledge and skills gained from the experiences of other minority American communities to further the agency of Afghan-Americans. Omar is a graduate of UC Santa Cruz, former high school teacher, and higher education administrator. Inspired by attending the inaugural AAC, Omar helped start The Samovar Network, which is an online forum for Afghans to discuss issues affecting the diaspora. He is currently working on receiving a PhD in Education at George Mason University. On the side, Omar works tirelessly to convince doubters that he is a life-long Golden State Warriors fan and has never rode on any bandwagon.",
             
             "Sabrina Barekzai is passionate about change, growth, and acceptance in the Afghan-American community. Coming of age in a post-9/11 world, she found herself between two worlds: being Afghan and being American.\n\nAfter attending the first AAC, she found hope, family, and a renewed sense of love for her dual identity. She was born and raised in Northern Virginia and currently lives in the San Francisco Bay Area where she works as a Social Media and Content Marketer at Salesforce. She majored in Mass Communications at Virginia Commonwealth University in Richmond, Virginia. She has worked as a music writer, and in the publishing and fashion industries prior to landing in tech. She hopes to one day visit her parent’s home of Kabul and find out if the mangoes really taste better in Afghanistan than they do anywhere else.",
             
             "Samim Abedi entered the inaugural 2015 AAC as an attendee and left humbled and hopeful at a generation of passionate Afghan-Americans, dedicated to self-betterment, and decided to get involved as an organizer. He is the Professional Network Chair, overseeing the creation and management of the AAConnect email platform and directory, where members share academic and professional opportunities and resources.\n\nHis parents moved to Brooklyn in the early 80's from Mazar-e-Sharif and are Uzbek-Afghans by background. Samim is a Portfolio Analyst at Google in the Bay Area and received a B.A. in Anthropology & Economics from Williams College, where he graduated with honors.",
             
             "Sophie believes she is most aligned with her purpose when she is helping her community work tirelessly to overcome generations of trauma. Growing up, her positive and negative experiences and interactions in the community encapsulated every reason she cares strongly about service for others, the power of human connection, and the ability to heal.\n\nSophie is a Surgical Technician in Newport Beach, California and is an aspiring Physician Assistant. She was born and raised in the Bay Area and lives in Orange County, California. Sophie graduated cum laude from UC Riverside, where she founded UCR’s then-defunct Afghan Students Association.",
             
             "Born and raised in Columbus, Ohio, Haroun grew up without an Afghan community (outside of his family). An AAC attendee in 2015, a speaker in 2016, and a cohort lead in 2017, Haroun decided to get involved as an organizer for our 2018 conference. He felt the conference provided him with so much both personally and professionally; he wanted to ensure the same is provided to all participants.\n\nHaroun is a Senior Analyst at The Wendy’s Company in Columbus, Ohio and the Head of Healthcare Management for GliaLab, a new startup that develops artificial intelligence solutions for the healthcare industry. He received his B.A. in International Studies at The Ohio State University and his M.H.A. from the University of Illinois at Chicago. Prior to Wendy’s and GliaLab, Haroun was a Consultant at Deloitte."]
    
    let subNameArray: [String] = ["Sofia Schersei", "Atiq Ahmadulla", "Nealofar Panjshiri", "Sabrina Noorzay", "Sajad Ghanizada"]
    let subTitleArray: [String] = ["Logistics Subcommittee", "Programming Subcommittee", "Logistics Subcommittee", "Marketing Subcommittee", "Marketing Subcommittee"]
    let subDescriptionArray: [String] =
        ["Being raised in Frankfurt, Germany, for almost fifteen years of her life, Sofia Schersei found herself in a limbo as an Afghan-American and Afghan-German. Nevertheless, her heritage as an Afghan was her constant identity in any space she found herself in. She resides in Las Vegas, NV, and attended George Mason University in Fairfax, VA, where she received her B.S. in Criminology, Law and Society with two minors in Intelligence Analysis and Nonprofit Studies.\n\nPassionate about her Afghan culture and community, Sofia became involved in the Afghan Student Union as a member at George Mason University. Through ASU, her team was able to support AAC at last year's event. This ignited her passion to stay involved with the Afghan American Conference and to join the Logistics Subcommittee.\n\nCurrently, Sofia works at Whittman Capital Management Investment and Estate Counsel. On her free time she serves as an adviser and volunteer for a youth leadership program, Camp Anytown. Additionally, she is the Alumna Vice President of External Affairs on the National Board for Kappa Phi Gamma Sorority, Inc.–a South Asian Interest Based organization. She oversees the national philanthropic side of the organization and is the Regional Adviser for the Northeastern undergraduate chapters.",
         
         "After attending AAC, Atiq became captivated by a group of dedicated Afghan-Americans that were brave enough to share their vulnerabilities. He wanted to come back to AAC to be part of a conversation where members are actively deciding the cultural future of our hyphenated community.\n\nAtiq received his Biology degree from the University of Kansas and continued on to medical school. While in medical school, he served as his state’s American Medical Association (AMA) president. He traveled to Washington D.C. to meet with congressional leaders to advocate for an increase in Graduate Medical Education. After two years of medical school, Atiq realized it wasn’t the best fit for him and rather than finishing medical school, Atiq went back to the University of Kansas and received an Engineering degree. He now works for Netsmart Technologies, a health IT company, as a consultant on the implementation team.",
         
         "Nealofar was born and raised in Northern Virginia to a big Afghan family and even bigger Afghan-American community. This sense of community has always imbued in Nealofar an eagerness to contribute back to Afghanistan through public service. Nealofar received her B.S. in Public Administration at George Mason University in 2014. From 2012 to 2015, she worked at the State Department in various roles involving Afghanistan, including working on international parental child abduction cases, serving as a staffer in the Office of the Special Representative for Afghanistan and Pakistan during Afghanistan’s 2014 presidential election, and serving as a regional alumni coordinator, providing grants to alumni of U.S-government sponsored exchange programs in South and Central Asia.\n\nNealofar is currently in her final year of law school at NYU School of Law. At law school she serves as a student advocate for the International Refugee Assistance Project (IRAP) where she is helping Afghan refugees resettle to the United States. After graduation she will be working as a litigation associate at Gibson, Dunn & Crutcher LLP in New York City.",
         
         "Sabrina was born and raised in Los Angeles, CA. Being inspired by her family, Sabrina has been involved with the Afghan-American community from a young age. Sabrina served as a board member of the United Afghan Club at UCLA, where she helped raise over $50,000 for Afghanistan. After attending AAC in 2015, her passion to serve and uplift our diaspora was renewed. She helped start the Afghan Mentorship Program, which aims to provide mentorship for Afghan-American youth in the United States.\n\nSabrina is currently a Digital Marketing Project Manager at L'Oreal in El Segundo, CA. She graduated from UCLA with a B.A. in Psychology. Prior to L'Oreal, Sabrina worked for Hitachi Consulting and Slalom as a Consultant.",
         
         "Sajad was born in Kabul and raised in the suburbs of Washington D.C. He's passionate about marketing, technology, and entrepreneurship and actively mentors organizations such as Founder Institute - Kabul.\n\nAfter being blown away by AAC 2017, Sajad Ghanizada has made it his personal mission to give back. As a product and marketing leader, Sajad hopes to leverage his skills to help AAC's mission in empowering, supporting, and engaging an ever-growing community."]


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
        
        let hView = header.createHeader(title: "Planning Team - 2018", subtitle:nil, imageURL: nil, image: headerImage, isProfile: false)
        
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return orgNameArray.count//13
        default:
            return subNameArray.count
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
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        
        label.text = "Test"
        
        if (section == 0){
            label.text = ""
        }
        else if section == 1 {
            label.text = "Organizing Committee"
        }
        else {
           label.text = "Subcommittee"
        }
        label.backgroundColor = .white
        return label

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as? CommitteeDescriptionCell else {
                return UITableViewCell()
            }
            
            cell.committeeDescription.text = "The Afghan-American Conference started as an idea implemented by a group of students and working professionals volunteering remotely from across the United States. Our team is comprised of individuals with deep passion for our community, a commitment to service, and diverse personal and professional experiences that seek to advance AAC’s vision of building a supportive, empowered, and engaged Afghan-American community.\n"
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "committeeCell") as? CommitteePersonCell else {
            return UITableViewCell()
        }
        
        var name: String = ""
        var title: String = ""
        
        if indexPath.section == 1 {
            name = orgNameArray[indexPath.row]
            title = orgTitleArray[indexPath.row]
        } else if indexPath.section == 2 {
            name = subNameArray[indexPath.row]
            title = subTitleArray[indexPath.row]
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
        
        if indexPath.section == 1 {
            name = orgNameArray[indexPath.row]
            title = orgTitleArray[indexPath.row]
            descp = orgDescriptionArray[indexPath.row]
        } else if indexPath.section == 2 {
            name = subNameArray[indexPath.row]
            title = subTitleArray[indexPath.row]
            descp = subDescriptionArray[indexPath.row]
        }
        
        destination.name = name
        destination.personTitle = title
        destination.personDescription = descp
        
        present(destination, animated: true, completion: nil)
 
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
