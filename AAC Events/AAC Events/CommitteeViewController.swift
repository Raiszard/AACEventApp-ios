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
    

    
    
    
 
    
    

    

    
    let orgNameArray: [String] = ["Zachia Nazarzai", "Sara Noorzay", "Atiq Ahmadullah", "Gina Karimi", "Arzo Kaderi", "Mukhtar Mayan", "Nazieh Fazli", "Madina Salemi Nooristani", "Aresh Ramin", "Sabrina Soha", "Lida Azim", "Omar Aziz", "Sophie Hossein"]
    let orgTitleArray: [String] = ["Executive Director", "Operations Director", "Administrative Chair", "Applications Chair", "Community Engagement Chair: Conference", "Community Engagement Chair: Non-Conference", "Community Initiatives Chair", "Finance Chair: Budget", "Finance Chair: Development", "Marketing Chair: Branding & Social Media", "Marketing Chair: Communications", "Programming Chair: Breakouts", "Programming Chair: Plenary"]
    let orgDescriptionArray: [String] =
        [    "Growing up, Zachia was surrounded by a large Afghan community in Southern California. However, it was upon joining the United Afghan Club at UCLA that she first started working with the community, and she has not stopped since. Zachia is driven by the strength of her community and hopes the Afghan-American Conference will serve as a space for the community to learn from and work with one another. \n\nZachia is a Policy Analyst on the Neighborhood Services team in Los Angeles Mayor Eric Garcetti’s Office. In her role, she works closely with the Department of Recreation and Parks and the LA Zoo. She received her BA in International Development Studies and Political Science from UCLA and her Masters in Public Policy and Management from Carnegie Mellon University.",
             
             "Born in Afghanistan, but raised in the United States, Sara always felt a deep connection to her Afghan roots. Serving her community was never an option, it was a requirement. As a previous member of the Afghan American Youth Council, a non-profit organization established post-9/11, Sara worked on various programs and events focused on engaging, supporting, and empowering the Afghan-American community in Southern California. Through the years, life became busy and her involvement with the community diminished–but after attending her first AAC conference in 2015, she felt inspired and energized to re-engage in a more meaningful way. After serving as an AAC participant the last few years, Sara decided to join the AAC Organizing Committee in 2017 and take an active role in shaping the experience for future participants. \n\nSara currently resides in Los Angeles and serves as a Sr. Customer Success Manager at Slack.",
             
             "After attending AAC, Atiq became captivated by a group of dedicated Afghan-Americans that were brave enough to share their vulnerabilities. He wanted to come back to AAC to be part of a conversation where members are actively deciding the cultural future of our hyphenated community. \n\nAtiq received his Biology degree from the University of Kansas and continued on to medical school. While in medical school, he served as his state’s American Medical Association (AMA) president. He traveled to Washington D.C. to meet with congressional leaders to advocate for an increase in Graduate Medical Education. After two years of medical school, Atiq realized it wasn’t the best fit for him and rather than finishing medical school, Atiq went back to the University of Kansas and received an Engineering degree. He now works for Netsmart Technologies, a health IT company, as a consultant on the implementation team. ",
             
             "Gina Karimi’s passion for the Afghan-American community began as a child, seeing her father participate in various community events to unite our community. In college, she was one of the leaders of ASA-West’s nationwide clothing, blankets and school supply drive for Afghanistan. Later on, she became more involved with the United Afghan Club at UCLA and the Afghan Health Initiative. \n\nGina is currently a statistical analyst in Los Angeles, CA and received her M.S. in Biostatistics from UCLA. She is passionate about music and advocates for musicians and artists. She also loves memes and the Los Angeles Lakers.",
             
             "Growing up in Southern California, Arzo was always surrounded by other Afghans through her dad’s work but avoided interacting with them. In her junior year of university, she was struggling to feel connected to her peers and she reluctantly joined the Afghan Student Association, where she instantly felt a sense of belonging. Her ASA attended the first AAC together and Arzo’s perception of the Afghan-American community changed drastically. She has attended three out of the four conferences and left each one feeling inspired and motivated to get involved. \n\nArzo moved to Washington, D.C. to work in international development. She is currently the Project Associate for the Social Enterprise Department at Population Services International, a global health NGO that focuses on issues such as women’s reproductive rights and family planning. She hopes to be able to follow this career path into Afghanistan one day. ",
             
             "Mukhtar currently works in Property Management in the greater NYC area. He graduated from Queens College with a degree in Psychology and minored in speech pathology. \n\nHis dream job growing up was to be a speech pathologist, as he started his career in the field he knew it wasn’t the right field for him. He caught himself getting too emotionally involved at the job. At AAC 2016, he met a great friend who introduced him to his into the property management field and the rest was history!",
             
             "Nazieh was born in Iran and raised in Australia. After graduating from university, she spent some time living in Hong Kong and London before moving to New York in 2016. In 2014, she joined the Executive Team at APN (Afghan Professionals Network) in London with a team of professional Afghans to develop educational, professional development and charitable initiatives that benefited the people of Afghanistan. In 2017, she joined the Women For Afghan Women (WAW) Junior Board to bridge the gap between the youth and older generation of Afghans in the community, as well as communicate the work of WAW both in New York and Kabul. Though she grew up in Australia, she has noticed the same pattern of cultural challenges faced by the Afghan community all over the world. \n\nNazieh is currently the Director of Internal Controls at Brookfield Asset Management and manages teams, both locally and globally, on financial risk, process improvement projects and audit and compliance initiatives.",
             
             "Being born in Kabul, Afghanistan and witnessing first hand the sacrifices her parents made to escape the war in order to give Madina a brighter future has made her realize how privileged she is. She has tried in the past to pay it forward to future generations who may not have been as fortunate through various organizations but none inspired her like AAC. \n\nShe hopes that AAC will continue to grow and prosper so that one day, it can give her son a community to belong to, learn from, and be proud of. Madina has worked on Wall Street at AIG for the past 12 years as an Actuary. She graduated New York University, Stern School of Business with a major in Actuarial Science, Finance and minor in Mathematics.",
             
             "Aresh was born and raised in Brooklyn, NY until his entire family moved out to the Lehigh Valley in Pennsylvania while in high school. He grew up in a large Afghan family and didn't have an Afghan community outside of that. Growing up as an Afghan-American, he faced the struggle of his family never understanding his life as an American and his friends never understanding his life as an Afghan. AAC gave him the community that he was searching for and created new friendships with people that share the same hyphenation. \n\nAresh graduated with a B.S. in Biology from Penn State University and graduated with a M.D. from the University of South Florida. He is currently completing his last year as a Resident Physician in Emergency Medicine. Aresh currently resides in the Bronx where he is doing his residency at the Montefiore Health System and Jacobi Medical Center, which is part of NYC Health + Hospitals.",
             
             "Sabrina was born and raised in Los Angeles, CA. Being inspired by her family, Sabrina has been involved with the Afghan-American community from a young age. Sabrina served as a board member of the United Afghan Club at UCLA, where she helped raise over $50,000 for Afghanistan. After attending AAC in 2015, her passion to serve and uplift our diaspora was renewed. She helped start the Afghan Mentorship Program, which aims to provide mentorship for Afghan-American youth in the United States. \n\nSabrina is currently a Digital Marketing Senior Manager at L'Oreal in El Segundo, CA. She graduated from UCLA with a B.A. in Psychology. Prior to L'Oreal, Sabrina worked for Hitachi Consulting and Slalom as a Management Consultant.",
             
             "Born and raised in the California Bay Area, Lida has always looked to give back. AAC became the outlet to do just that. As an AAC participant the last few years, Lida focused her energy towards empowering her community. She was part of the Civic Engagement Task Force with six other AAC alum. The Task Force eventually ended but the work continued with the formation of the Afghan Diaspora for Equality and Progress, a non profit focused on raising awareness of social injustice and organizing change-makers in our community. Continuing in her efforts to be an active and involved member of the community, Lida joined the AAC Organizing Committee. She’s excited to give back to the same organization that gave her this community she loves so dearly. \n\nLida currently lives in Washington, D.C. and is a graduate student at American University pursuing a masters in International and Intercultural Communications.",
             
             "Omar Aziz is a proud Fremonti who grew up with Afghan soccer, Lake Elizabeth picnics, and the beautiful chaos of Afghan Sunday school. Hip-hop music and culture educated him to think critically about society, and he hopes to use the knowledge and skills gained from the experiences of other minority communities to further the agency of Afghan-Americans. Omar is a graduate of UC Santa Cruz, former high school teacher, and higher education administrator. \n\nInspired by attending the inaugural AAC, Omar helped start The Samovar Network, which is an online forum for Afghans to discuss issues affecting the diaspora. He is currently a Graduate Teaching Assistant and PhD student in Higher Education at George Mason University. On the side, Omar works tirelessly to convince doubters that he is a life-long Golden State Warriors fan and has never rode on any bandwagon. ",
             
             "Sophie believes she is most aligned with her purpose when she is helping her community work tirelessly to overcome generations of trauma. Growing up, her positive and negative experiences and interactions in the community encapsulated every reason she cares strongly about service for others, the power of human connection, and the ability to heal. \n\nSophie is a Surgical Technician in Newport Beach, California and is an aspiring Physician Assistant. She was born and raised in the Bay Area and lives in Orange County, California. Sophie graduated cum laude from UC Riverside, where she founded UCR’s then-defunct Afghan Students Association."
    ]
    
    let subNameArray: [String] = ["Samir Fazelyar", "Jasmine Afzali", "Mena Ayazi", "Nadia Sikander", "Sahar Adina", "Spozhmai Wardak", "Yama Amin", "Sofia Schersei", "Sadaf Islamzada", "Zohal Azimi", "Abdul Manan", "Michelle Ghafar", "Donia Ghorab", "Robia Qasimyar", "Mariam Azizi"]
    let subTitleArray: [String] = ["Applications Team", "Community Engagement & Initiatives Team (SoCal)", "Community Engagement & Initiatives Team (DMV)", "Community Engagement & Initiatives Team (Tri-State)", "Community Engagement & Initiatives Team (NorCal)", "Finance Team", "Finance Team", "Logistics Team", "Marketing Team", "Creative-in-Residence", "Professional Networking Team", "Professional Networking Team", "Programming Team", "Programming Team", "Programming Team"]
    let subDescriptionArray: [String] =
        [
            "Samir Fazelyar works in cyber/information security as a Technology Risk Officer at Goldman Sachs managing global technology risk governance for the Investment Management Division. He received his B.S. in Applied Information Technology at George Mason University in 2016. Born and raised in Northern Virginia, Samir has been involved with his community via the Mustafa Center.",
            
            "Jasmine Afzali was born and raised in Southern California. Growing up, she felt struggled with her identity of being Afghan-American and was disconnected with her Afghan side. It was until she attended the inaugural AAC, she felt home. She felt connected. A sense of belonging. She got a better understanding of her identity and her role within the community. Jasmine is passionate about AAC's vision and being part of an organization that provides a platform for the future generations; one that she wished she had growing up. \n\nDuring her last year at the University of California, San Diego, she was the president of the Afghan Student Association, where she and her team successfully raised over 15k for children in Afghanistan. She has been involved with many other community engagements and plans on continuing to do so. \n\nShe is currently in the process of advancing her education in healthcare and is working in the medical field. Prior to deciding to go back to school, she worked as a clinical trial assistant at IQVIA, where she realized her passion lies elsewhere.",
            
            "As a DMV native, Mena grew up surrounded by a large Afghan community and first got involved through volunteering for an Afghan women’s NGO, Kandahar Treasure, which works to economically empower Afghan women through the revival of khamak embroidery. Mena began to drift away from the community as the lines between her Afghan and American identities blurred in college. It wasn’t until she got involved with the Afghan Student Union in university and attended AAC last year for the first time, that her passion for serving the community reignited due to the open-mindedness and drive for progress she saw among her peers. Mena believes in the power of AAC to serve as a platform for much needed dialogue to catalyze change in the Afghan-American community and is excited to work towards expanding and strengthening its’ agency. \n\nMena currently resides in the DMV and is a Master’s Candidate at George Mason University’s School for Conflict Analysis and Resolution, where she is researching how transnational war narratives live among and shape the Afghan diaspora. She also works at the U.S. Institute of Peace as a Research Assistant for the Gender Policy and Strategy team and is the Program Coordinator for the U.S. Civil Society Working Group on Women, Peace and Security.",
            
            "Born and raised in New York, Nadia Sikander grew up around many Afghans. However it wasn’t until joining the Afghan Students Association at New York University that she realized how divided the community was. Attending AAC for the first time in 2016 illustrated to her how much was possible with an empowered, engaged and unified Afghan diaspora. In 2017 she volunteered in Greece with Afghan and Syrian refugees. Here, she saw the importance of service and left with a hunger to help her community in whatever capacity she can. \n\nNadia currently resides in Long Island, New York. She works as Community Coordinator for Yelp, where she brings foodies from all backgrounds together to support local businesses on Long Island. Additionally, she manages residential and commercial properties in Manhattan.",
            
            "Sahar Adina was born and raised in the Bay Area but found herself more involved with the Afghan community when she joined the Afghan Student Association as a student at UC Riverside. She has attended the first 3 conferences, and each year she has left the weekend feeling more hopeful about the future of the Afghan-American community. \n\nSahar graduated with a degree in Psychology and currently works with children on the autism spectrum. She is an aspiring physician who loves to play basketball and watch her Warriors win championships.",
            
            "Born and raised in Connecticut, Spozhmai has come to love being from New England, but this has contributed to her feelings of disconnect with the community. As a result of her isolated geographical location and lack of exposure to other Afghans, she struggled with developing her Afghan identity. AAC provided her with a platform to explore this and form relationships within the community, which in turn fueled her desire to give back by joining a subcommittee. Her father is her biggest inspiration to connect with her heritage; hearing his life story and the nostalgia in his voice when he speaks of Afghanistan makes her hopeful that one day the country will be restored so she can visit. \n\nSpozhmai is a proud UCONN alumnae. She currently works at The Hartford Financial Services Group, Inc., in their strategic claims management group as a claims representative.",
            
            "Yama was born and raised in America, yet his family had only migrated from Afghanistan a few years before he was born, so he has always considered himself to have grown up in the midst of two very different cultures: a cultural limbo at times. Yama's upbringing and narrative has led him to be passionate in getting more involved in the Afghan-American community, whether if it is by promoting growth through his involvement in his university's ASU, or actively gauging dialogue on taboo topics like mental health. Yama attended his first AAC in NYC in 2018, and upon leaving, he felt a stronger drive to be involved in the AfgAm community on a grander level. \n\nYama is currently a sophomore in the Honors College at George Mason University where he is studying computer science and statistics. Outside of academics, Yamais an intern analyst at a local market intelligence firm, and also teaching assistant at GMU. Yama likes to explore and tackle many new things in life, whether it is traveling, bungee jumping, or picking up a new book to read.",
            
            "Being raised in Frankfurt, Germany, for almost fifteen years of her life, Sofia Schersei found herself in a limbo as an Afghan-American and Afghan-German. Nevertheless, her heritage as an Afghan was her constant identity in any space she found herself in. She resides in Las Vegas, NV, and attended George Mason University in Fairfax, VA, where she received her B.S. in Criminology, Law and Society with two minors in Intelligence Analysis and Nonprofit Studies.\n\nPassionate about her Afghan culture and community, Sofia became involved in the Afghan Student Union as a member at George Mason University. Through ASU, her team was able to support AAC at last year's event. This ignited her passion to stay involved with the Afghan American Conference and to join the Logistics Subcommittee.\n\nCurrently, Sofia works at Whittman Capital Management Investment and Estate Counsel. On her free time she serves as an adviser and volunteer for a youth leadership program, Camp Anytown. Additionally, she is the Alumna Vice President of External Affairs on the National Board for Kappa Phi Gamma Sorority, Inc.–a South Asian Interest Based organization. She oversees the national philanthropic side of the organization and is the Regional Adviser for the Northeastern undergraduate chapters.",
            
            "Born and raised in Virginia but never far from her Afghan roots, Sadaf has taken on several projects revolving around the Afghan diaspora. She is excited to take on this new role as a member of the Marketing Subcommittee. Sadaf has a passion for group involvement and advocacy and is looking forward to working with the Organizing Committee to foster a supportive Afghan-American community. She currently serves as the Advisor to the President of Afghan Academy, a non-profit organization, where she focuses on youth engagement and teaches culture and religion. \n\nSadaf graduated from George Mason University with a B.A. in Communications and a concentration in journalism, and currently works as a Federal consultant. In her free time, Sadaf enjoys traveling, photography, and finding unique food spots throughout the DMV.",
         
            "Growing up in Long Island, Zohal was always surrounded by Afghans and knew that she wanted to support this community. Upon attending her first AAC conference, she felt motivated to engage in the Afghan American community in a significant and meaningful way.\n\nBeing in love with design her whole life, Zohal graduated with a Graphic Design degree and is currently working as a freelance designer. Throughout her career, she found herself working with various people who saw the value in being generous and community-minded. She was always passionate about giving back to the community and has worked with clients who emphasize social responsibility and charitable giving. Aside from her profession, Zohal has always had a strong interest in the fashion industry. Her love for fashion pushes her to pursue her own fashion line one day that gives back to the community.",
         
            "Abdul was born and raised in North Potomac, Maryland where he lacked an Afghan community. He had his first interaction with the Afghan community after his first year at AAC (in Washington, DC). It was then he realized his desire to help the diaspora move forward by improving connectivity. \n\nAbdul graduated from the university of Maryland, College Park with degrees in both criminology and economics. He started his career at Booz Allen Hamilton while simultaneously running 28 Ventures, an investment fund that specialized in emerging technologies and the pharmaceutical industry. He is currently the Founder/CEO of Digital Holdings, a Digital Asset exchange and education platform based in Dubai. ",
         
            "Michelle grew up in the Bay Area, and has worked with social justice and nonprofit organizations throughout her educational and professional life. \n\nShe worked for several years before law school as a communications coordinator for a criminal justice nonprofit in Oakland, CA. Later, as a law student, she interned with nonprofits across the country and worked directly with impacted communities, including mentally ill, LGBTQI, and homeless individuals. After getting her law degree with specializations in public interest and critical race studies, she ran a direct services clinic for reentry clients. She is currently an environmental attorney at Earthjustice in San Francisco.",
         
            "As a first-generation Afghan-American with a majority of her extended family still in Afghanistan, Donia often struggles with bridging the two parts of her identity and with feeling a sense of belonging.  Although she was somewhat involved with Afghan student groups throughout college, it wasn’t until she attended AAC in 2017 that Donia began actively engaging with the Afghan-American community. \n\nDonia holds a B.S. in Information Systems and Operations Management and an M.A. in International Commerce and Policy, both from George Mason University.  She has served almost ten years in the Federal government, during which time she has worked at four different agencies.  She is currently at the U.S. Department of State, where she works on strategic planning, performance reporting, and evaluation.",
            
            "Robia was born and raisedin Eastern Nebraska, where she currently resides. Although not as large as some on the East and West coasts, Nebraska does have a sizeable Afghan population that Robia grew up being a part of. Afghans in Nebraska--they do exist! She is passionate about serving others and advocating for those in need. While in undergrad, she served on leadership boards for her university's Afghan Student Association and International Student Services, where she helped organize fundraisers for refugees, banquets, and social gatherings. Robia received her BS in Psychology and MPA in Nonprofit Management. With previous experience in higher education at the college level, Robia is currently a young professional in the nonprofit industry. In her free time, Robia enjoys watching Bollywood movies--her dil dolas for SRK.",
            
            "Born and raised in Orange County, Mariam grew up in a large Afghan family but did not realize how present a broader Afghan-American community was. She had always been an active member of her local community, however her involvement with Afghans was limited. After attending her first AAC in 2018, she became inspired to increase her involvement with the community as a whole. She hopes AAC will continue to serve as a space where the vision of peace and prosperity can come to fruition. \n\nShe is currently in her second year of college pursing a Bachelor’s Degree in Political Science. Mariam is an aspiring attorney and plans to attend law school after graduation. She hopes to pursue her passion for politics through public service in the future."
            ]


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
           label.text = "2019 Subcommittee"
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
