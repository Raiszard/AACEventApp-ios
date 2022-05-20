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
    

    
    
    
 
    
    

    

    
    let orgNameArray: [String] = ["Zachia Nazarzai","Dawoud Niaz","Edrees Kharzai","Nashwa Osmani","Hamza Yaqoobi","Silgai Mohmand","Yosef Mahmood","Aresh Ramin","Bahman Hassan","Darya Moini","Lida Azim","Robia Qasimyar","Sabrina Zarifi","Sadaf Rohani","Yama Amin","Omed Amin","Husna Ghayaisi","Nadeema Safi","Sahar Yaqubi"]
    let orgTitleArray: [String] = ["Executive Committee, Director","Executive Committee, Operations Director","Executive Committee, Finance Lead","Executive Committee, Community Engagement Lead","Academic & Professional Development Committee, Education Team","Academic & Professional Development Committee, Education Team","Conference Committee, Director","Conference Committee, Programming Team Lead","Conference Committee, Operations Team","Conference Committee, Operations Team Lead","Conference Committee, Programming Team","Conference Committee, Programming Team","Conference Committee, Programming Team","Conference Committee, At-Large Member","Conference Committee, Operations Team","Marketing Committee, Director","Marketing Committee, Digital Marketing Lead","Marketing Committee, Creative Lead","Marketing Committee, Communications Lead"]
    let orgDescriptionArray: [String] =
        [    "Growing up, Zachia was surrounded by a large Afghan community in Southern California. However, it was upon joining the United Afghan Club at UCLA that she first started working with the community, and she has not stopped since. Zachia is driven by the strength of her community and hopes the Afghan-American Conference will serve as a space for the community to learn from and work with one another.\n\nZachia is the Director for International Relations, Policy, & Protocol for Los Angeles Mayor Eric Garcetti. She received her BA in International Development Studies and Political Science from UCLA and her Masters in Public Policy and Management from Carnegie Mellon University.",
             
             "A strong believer in strategic planning and building long-term sustainable success, Dawoud lives at the intersection of liberal arts and technology. Outside of work, he enjoys running marathons, relaxing in the sauna, working on technology and spending time with family.","Edrees grew up at the heart of the Midwest in Columbus, Ohio, and only knew a small handful of Afghans outside his family. Attending AAC for the first time at UC Irvine in 2019 was an eye-opening experience, meeting Afghan-Americans from all walks of life and building a safe space to share their stories. \n\nEdrees completed his B.A. in Public Management, Leadership and Policy, with a specialization of Fisher's Dean's Leadership Academy at The Ohio State University. Edrees is a big fan of sports including tennis, soccer, and will never let anyone talk down the Ohio State Buckeyes!",
             
             "Nashwa was born and raised in Northern Virginia. She is currently an undergraduate student at George Mason University where she is studying Clinical Psychology and aims to become a trauma therapist. In recent years, she has been able to widely connect with the Afghan-American community although this wasn't always the case growing up. She served as the George Mason University Afghan Student Union President where she worked to build a sense of unity and inclusivity among Afghan-American students and attended the 2021 virtual AAC which allowed her to meet other Afghans and witness the strong changes that can come from a united community. ",
             
             "Hamza Yaqoobi is part of AACO’S Academic & Professional Development Committee.  He joined AACO to give back to the community that has given him so much and to support Afghan Americans in their academic and professional journeys.\n\nCurrently, Hamza is a Student Affairs practitioner at the University of Utah, where he is also pursuing a graduate degree in higher education and student affairs.",
             
             "Silgai Mohmand is a newly admitted attorney in California and a Post-Bar Law Clerk at the Orange County Public Defender’s Office. She was born and raised in Southern California, but she proudly identifies as being from Afghanistan. She is one of the co-founders of Muslawmah, an organization dedicated to empowering and supporting Muslim women in the legal field. She is also involved in various Afghan and Muslim communities in So-Cal. Silgai earned her J.D. from Chapman University, Fowler School of Law and received a bachelor’s degree in Economics from University of California, Irvine. During law school, she was a merit scholar and awarded the Joann Leatherby Leadership Award for Women in the Law. Some of her activities included serving as the Editor-In-Chief of her school’s Diversity and Social Justice Forum and President of the Muslim Law Student Association. Silgai has always been passionate about serving various communities and providing resources for underserved communities. She hopes to be able to give back to the Afghan community and further empower them. \n\nIn her free time, Silgai enjoys traveling, photography, checking out OC/LA’s newest spots and spending time with friends and family",
             
             "Yosef Mahmood is a proud Halfgan, born and raised in Fresno, CA, where he grew up largely separated from the larger Afghan-American diaspora.  Since attending his first Conference in 2016, Yosef has renewed his connection with his cultural identity and found his community.  \n\nYosef now lives in Los Angeles in multi-cultural wedded bliss with his Half Armenian wife, Nicole.  He is thrilled to have this opportunity to give back and lead the Conference that has given him so much. \n\nYosef currently serves as a Deputy City Attorney at the Los Angeles City Attorney's Office, where he litigates consumer protections cases. Prior to entering public service, he was a Litigation Associate at Kirkland & Ellis LLP. Yosef attended Fresno State for his undergraduate degree, where he earned the Dean's Medal from the College of Arts & Humanities, and UCLA for his J.D., where he graduated Order of the Coif. In law school, Yosef also served on the Moot Court Honors Board and was the Editor-In-Chief of the UCLA Journal of Environmental Law and Policy.",
             
             "Aresh was born and raised in Brooklyn, NY until his entire family moved out to the Lehigh Valley in Pennsylvania while in high school. He grew up in a large Afghan family and didn't have an Afghan community outside of that. Growing up as an Afghan-American, he faced the struggle of his family never understanding his life as an American and his friends never understanding his life as an Afghan. AAC gave him the community that he was searching for and created new friendships with people that share the same hyphenation.\n\nAresh graduated with a B.S. in Biology from Penn State University and graduated with a M.D. from the University of South Florida. He is currently completing his last year as a Resident Physician in Emergency Medicine. Aresh currently resides in the Bronx where he is doing his residency at the Montefiore Health System and Jacobi Medical Center, which is part of NYC Health + Hospitals.",
             
             "Bahman was born in and raised in Queens, NY. He has a large family and network of Afghans within his community. Due to his exposure with a large network of Afghans, he grew up being passionate about culture and giving back to his community. After attending AAC for the first time, Bahman knew he wanted to be a part of a platform that not only brings people together, but helped him understand his own identity. Since attending AAC, Bahman has contributed back to his community in various ways. Whether it was partaking in social justice and organizing protests throughout NYC, or bringing community together socially in hosting gatherings to have conversations with fellow AAC alumni.\n\nBahman has his Bachelors in Business Administration from DeSales University. Currently Bahman works as a Department Manager for Nordstrom. In his free time Bahman enjoys traveling, trying new foods and bowling. He hopes by joining the AACO committee he can help navigate new attendees in finding a common community, and strengthening their ties to their own Afghan identity.",
             
             "Darya is a proud New Yorker. She grew up with a large extended family of Afghans. She was raised in a dual identity/ 'sushi' household, so her identity was always difficult to understand growing up. Other than her family, she felt she never really fit in with other Afghans, until she took the leap and attended AAC in 2018. She made her forever family, and understood how to navigate her American identity and Afghan identity. AAC not only strengthened her ties to her community and culture but introduced her to a vast network of like minded individuals who share a common identity. \n\nDarya speak 4 languages. She received her Bachelors in Political Science and Economics. She currently works as an Operations Analyst based out of NYC. In her free time she enjoys traveling, trying new things, and all things Marvel!",
             
             "Lida is a second-generation Afghan-American and community organizer based out of Washington D.C, where she received her master’s in Intercultural and International Communications from American University. A native of the Bay Area, she is the co-founder of the Afghan Diaspora For Equality and Progress (ADEP). Her current work focuses on combating Islamophobia and anti-Muslim bigotry on a nationwide scale.\n\nHer writing has been published in Newsweek and has been cited in Al Jazeera, Vox, LA Times, and Business Insider, among other media outlets globally. Lida joined the AACO Organizing Committee in 2018 in hopes of continuing her efforts in being an active and involved member of the community. She loves giving back to the same organization that gave her the community she loves so dearly.",
             
             "Robia proudly represents the Midwest, baby. She is passionate about serving others and advocating for those in need, which led her to pursue Bachelor of Science in Psychology and Master of Public Administration degrees. With previous experience in higher education at the college level, Robia currently works in philanthropy, supporting local organizations that promote racial justice and social equity. In her free time, Robia enjoys getting lost in novels, defending her Hogwarts House (Slytherin), and watching Turkish dramas and Bollywood movies—her dil dolas for SRK. ",
             
             "Sabrina identifies as a first-generation Afghan Mexican American. She was born and raised in Los Angeles, Ca. Currently, she resides in Washington, DC where she works full time as a Communications Associate at the National Association of Manufacturing. She received her Master of Studies in Law degree from USC Gould School of Law, where she had a concentration in Business Law and a second concentration in Compliance.  Previously, she received her bachelor's degree in Legal Studies with a minor in Sociology from UC Santa Cruz. During her time at Santa Cruz, Sabrina  was President of the Phi Alpha Delta Pre-Law Fraternity and was a Transfer Peer Mentor. ","After participating in AACO's first virtual conference, Sadaf became even more dedicated to giving back to the community and is excited to do so as part of the Conference Committee. She received her B.S. in Neuroscience with a minor in Psychology from George Mason University, along with a Master's degree in Data Analysis and Applied Statistics from Virginia Tech. Currently, she works as a Statistician/Data Scientist for the federal government. ",
             
             "Yama was born and raised in Herndon, VA. Despite growing up in the Afghan diaspora hotspot that is Northern Virginia, Yama only became an active member in this community since starting college. Yama has since played various roles in the Afghan-American community, whether that has been through his university's ASU or AACO, and he’s thankful for the many life-long connections made in-between. Above all, Yama is inspired by the Afghan-American community and is thrilled for the return of an in-person conference as he believes that AAC is just at the front of the pipeline for building a stronger, more connected diaspora.\n\nYama is currently a Technical Program Manager at Amazon Web Services and earned a B.S. in computer science and a B.S. in statistics in 2021 from the Honors College at George Mason University. In his free time, Yama enjoys traveling, spending time with friends, and trying new things.",
             
             "Omed currently serves as the Marketing Director of AACO. He lives in Herndon, Virginia and works as a Senior Systems Engineer at The MITRE Corporation. He holds a Master's in Systems Engineering and a Bachelor's degree in Electrical Engineering, both of which he received from George Mason University in Fairfax, Virginia. In his free time, he enjoys traveling, video editing, and hanging out with friends. ",
             
             "Husna Ghayaisi was born in Afghanistan and moved to the US at the age of 5.  She has a background in marketing, advertising, PR and graphic design. She currently works as a marketing manager for a tech start-up while working on establishing her own e-commerce business on the side. Her previous experience includes working as a Global Advertising Operations Specialist for Panasonic Avionics. She is passionate about giving back to her community, and in her free time she volunteers by helping children with disabilities reach their full potential.",
             
             "Growing up in Denver, Colorado, Nadeema never had a strong Afghan community surrounding her. It wasn't until she joined the AACO space that she was able to see the overwhelming positive effects of having the Afghan community’s support. Nadeema graduated from the University of Colorado, Denver with her bachelor of science degree in Public Health. Alongside her family, she recently made the move to Herndon, Virginia, where she continues to work towards achieving her goals.",
             
             "I am a current MBA student at Southern Methodist University working as an analytics solutions manager in the digital marketing space. I am also the current communications lead for AACO and so excited about attending my very first AAC! Philanthropy is a passion of mine and being able to get involved in the Afghan-American space has been such a fulfilling and amazing experience so far."
    ]
    
    let subNameArray: [String] = ["Atia Abawi",
                                  "Farhat Hanifi",
                                  "Homaira Hosseini",
                                  "Madina Nooristani",
                                  "Mohammad Ali Aziz-Sultan, MD",
                                  "Sabrina Perrino, MD",
                                  "Spojmie Nasiri",
                                  "Sultan Latif"]
    let subTitleArray: [String] = ["AACO Board",
                                   "AACO Board",
                                   "AACO Board",
                                   "AACO Board",
                                   "AACO Board",
                                   "AACO Board",
                                   "AACO Board",
                                   "AACO Board"]
    let subDescriptionArray: [String] =
        [
            "Atia Abawi is a foreign correspondent and author now based in Los Angeles, California after spending more than a decade living in Afghanistan and the Middle East. She currently serves as an International Affairs analyst for NBC News.\n\n Abawi was born a refugee to Afghan parents in West Germany and was raised in the United States. She graduated from Virginia Tech with a degree in Communications and International Studies, and was awarded the school’s Outstanding Alumna honor. Abawi went on to work for CNN, NBC News, and Al Jazeera English as a foreign news correspondent. She has covered stories from all over the world. Abawi was stationed for almost five years in Kabul, Afghanistan, before moving to Jerusalem in 2013. She has won numerous awards for both her journalistic achievements and written, including The George Foster Peabody Award and The duPont-Columbia Awards. \n\nHer first book, 'The Secret Sky: A Novel of Forbidden Love in Afghanistan' was published by Penguin Books in 2014. Her next novel, 'A Land of Permanent Goodbyes' based on the Refugee Crisis was released by Penguin Random House in 2018. Atia’s latest book released in March 2021 and is a part of Chelsea Clinton’s ‘She Persisted’ Series in which she profiled Sally Ride. ",
            
            "Farhat Hanifi serves as the Director of Philanthropy for the Waterford Foundation where she oversees the implementation and execution of domestic and international projects that serve under-resourced communities.\n\nShe is a founding board member for the Valley Health Education Foundation, a non-profit dedicated to promoting access to higher education in health sciences and related fields in the San Joaquin Valley of California. Farhat was a founding committee member of the Afghan-American Conference and served as the Finance Co-chair for the first three years of its inception. She is also a proud Bruin and graduated from UCLA with a degree in Anthropology. Farhat presently lives in Fresno, California with her wonderful husband and amazing son.",
            
            "Homaira Hosseini was born in Herat, Afghanistan and raised in Fremont, California. Currently, she is Litigation Counsel for Lyft in San Francisco. \n\nPreviously, she was a Litigation Associate at Morgan Lewis & Bockius. Homaira is barred in both California and Texas. Homaira completed a Coro Public Policy Fellowship in San Francisco. She received a bachelor's degree in Political Science and Public Affairs from UCLA and a J.D. from Berkeley Law School where she was honored as a Paul & Daisy Soros Fellow. Homaira served on the AAC Organizing Committee for 3 years as the Professional Networking Coordinator and Community Initiatives Chair. She now proudly serves as Chair of the Afghan-American Community Organization Board of Directors. ",
            
            "Madina Nooristani was born in Kabul, Afghanistan and raised in New York. Madina has worked on Wall Street at AIG as an Actuary for 12 years and as a Finance Manager at S&P Global. \n\nCurrently, she is a Product Manager for a startup named Branch Financial, and she is based in Southern California. She graduated from New York University, Stern School of Business with a major in Actuarial Science, Finance and minor in Mathematics. Madina has served on the AAC Organizing Committee for 6 years as the Finance Lead and on the Executive Team. She now proudly serves our diaspora and Afghanistan on the Afghan-American Community Organization Board of Directors.",
            
            "Born in Kabul, Afghanistan, Dr. Mohammad Ali Aziz-Sultan embarked on his lifelong commitment to health and innovation after receiving his Medical Degree at the George Washington University School of Medicine. Dr. Sultan proceeded to complete his Neurosurgical Residency with an in-folded Radiology Fellowship at the University of Miami, followed by two Fellowships at the Barrow Neurological Institute in Phoenix Arizona (one in Endovascular Neurosurgery and the other in Cerebrovascular and Skull Base Surgery). Respected among peers and understanding the importance of innovation, Dr. Sultan quickly advanced to the position of Associate Professor of Neurosurgery and Director of Endovascular Surgery at the University of Miami Miller School of Medicine. Opportunity giving way to present day, Dr. Sultan currently holds the title of Associate Professor of Neurosurgery at the Harvard Medical School, and Chief of Vascular and Endovascular Neurosurgery at Brigham and Women’s Hospital, all the while pursuing a degree in Master of Business Administration at the Massachusetts Institute of Technology which he completed in the Spring of 2019.\n\nDr. Sultan’s most impactful contributions have been in the field of education. He has published over 120 peer-reviewed articles and book chapters and is an ad hoc editor for several of the most prominent neurosurgical publications. He has been involved in training of over 60 residents 25 fellows in neurosurgery and currently serves as the associate program director for the residency at Brigham.  Most of the fellows that have trained with him have gone into academic programs and are now training other physicians. He is an invited speaker at most of the national and international cerebrovascular conferences.  He has also used his platform at Harvard to tell his story as a young Afghan refugee who fled a war torn country at the age of six to eventually come to the United States. The opportunities afforded by education has allowed him to practice medicine in an unparalleled environment. He has given these stories of hope and resilience of the Afghan people as invited professor at Universities and to the Afghan-American Conference aimed towards youth empowerment.  He has also returned to his homeland on a few occasions to help collaborate with neurosurgeons in Kabul Afghanistan in service to the Afghan community. ",
            
            "Dr. Sabrina Perrino is a board-certified pediatrician at Kaiser Permanente in San Diego. She earned her Medical Degree at the New York Medical College and completed her pediatric residency at Loma Linda University.  She has self-published two children's books, 'Dill and the Search for Mommy' and 'Imani is Allergic to Peanuts.' Her interviews of amazing people can be found on docmominspired.com. She is co-founder of the San Diego Pediatricians for Clean Air and is on the Board of Directors of the San Diego Chapter of the American Academy of Pediatrics (AAP-CA3). She proudly serves on the Board of Directors of AACO. ",
            
            "Spojmie Ahmady Nasiri is a first-generation immigrant and the founder and principal attorney at the Law of Spojmie Nasiri, PC in Pleasanton, CA.  Spojmie Nasiri received her B.A. from the University of California, Davis in 1997 and her Juris Doctorate from Golden Gate University, School of Law in 2003. She is a member of the California State Bar and is admitted to the Northern District of California. She focuses on family-based immigration, consular processing and deportation defense cases.  Spojmie currently serves on the board of Afghan American Community Organization dedicated to serving the Afghan community and board member of International Orphan Care (IOC) dedicated to helping orphans in Afghanistan. She has served as board President of Council on American Relations (CAIR) for the San Francisco Bay Area Chapter protecting the civil rights of Muslim Americans. She is currently part of the American Immigration Lawyers Association Afghan Response Task Force helping Afghan refugees. ",
            
            "Sultan Latif is an environmental scientist who has worked with several academic institutions and intergovernmental organizations focusing on the water, energy and climate change nexus.  Currently, he is the Director of the Humanitarian Climate Crisis Unit at Save the Children where he is charged with helping the organization adapt to the new realities of their global humanitarian work by focusing on the impacts of climate change and environmental degradation. In addition, Sultan is adjunct faculty at Johns Hopkins University teaching environmental analysis and policy. Previously, he was an Oak Ridge Institute for Science and Education fellow at the US Department of Energy, a Science and Policy Advisor for Greenpeace International and a field worker for Doctors Without Borders. He has a graduate degree in Environmental Science from Harvard University, as well as an undergraduate degree in Civil Engineering from George Washington University. "
            ]
    
    let ccNameArray: [String] = ["Alexandra Millatmal",
                                 "Hasina Mohammad",
                                 "Weiss Hamid"]
    
    let ccTitleArray: [String] = ["Code of Conduct Coordinator","Code of Conduct Coordinator", "Code of Conduct Coordinator"]
    
    let ccDescriptionArray: [String] =
    ["A product of the small-town Midwest, Alex has always been a 'half-ghan'; feeling neither here nor there. While her undergraduate studies gave her the vocabulary to better understand and challenge her view of herself and the world, spending time with her family in Kabul and Jalalabad gave her a basis from which to define her own hyphenated experience. Since that impetus, she’s engaged more deeply in diasporic community as a cohort member of AAAWA’s inaugural Afghan Literary Futures workshop, a presenter at the Afghan-American Conference in 2020 and 2019, and a former member of Ajam Media Collective’s digital archive team. \n\nAs a software engineer at Newsela, an education tech company, Alex writes code that allows editorial teams to create and publish complex curricula centered on real-world content, like breaking news. She came to coding from an award-winning career in journalism, where she structured online conversations around international politics. Alex finds herself preoccupied with feminisms, liminality, and critique of liberal-secular space and discourse. She lives in Bed-Stuy, Brooklyn with her cats, Shamousa and BAMF. ",
     
     "Even though she was born in the United States, Hasina has maintained close ties with the Afghan community in Southern California as well as Afghanistan itself. After several years of involvement with AACO, Hasina became one of the initial Conduct Coordinators in AACO’s history. By employing her professional experience, Hasina hopes to assist AACO develop and grow as a progressive, resourceful entity for the Afghan-American community.\n\nHasina earned her B.A. degree in Psychology from U.C. Santa Barbara and a M.A. degree in School Counseling with a PPS Credential from CSU Dominguez Hills. Currently, she assists high school students further their academic potential",
     
     "Weiss Hamid is a data privacy and litigation associate at Buchalter, APC, in Los Angeles. While attending law school, Weiss served as Editor-in-Chief of Production of the Los Angeles Public Interest Law Journal, a collaborative law journal that works across the Loyola, USC, UCLA, and Pepperdine campuses, focusing on producing academic and practitioner articles that promote social issues pertinent to Los Angeles, such as immigration, human trafficking, and civil rights for the LGBTQ community. Additionally, Weiss co-directed the New Leaders Council’s Engaged program, facilitating important dialogue regarding criminal justice, housing and education. He is also a coordinator and co-host for the Samovar Network, a multimedia venue dedicated to having honest conversations and modeling dialogue within the Afghan diaspora.\n\nWhen Weiss isn’t lawyering, his interests are basketball, and getting into various sports-related arguments."]


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
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return orgNameArray.count//13
        case 2:
            return subNameArray.count
        default:
            return ccNameArray.count
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
            label.text = "Committee Members"
        }
        else if section == 2 {
            label.text = "Board of Directors"
        }
        else {
           label.text = "Code of Conduct Coordinators"
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
            name = orgNameArray[indexPath.row]
            title = orgTitleArray[indexPath.row]
        } else if indexPath.section == 2 {
            name = subNameArray[indexPath.row]
            title = subTitleArray[indexPath.row]
        }
        else if indexPath.section == 3 {
            name = ccNameArray[indexPath.row]
            title = ccTitleArray[indexPath.row]
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
        else if indexPath.section == 3 {
            name = ccNameArray[indexPath.row]
            title = ccTitleArray[indexPath.row]
            descp = ccDescriptionArray[indexPath.row]
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
