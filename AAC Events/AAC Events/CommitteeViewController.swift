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
    

    
    
    
 
    
    

    

    
    let execNameArray: [String] = ["Zachia Nazarzai", "Dawoud Niaz", "Sara Noorzay","Omar Noorzay"]
    let execTitleArray: [String] = ["Executive Director", "Chief Strategy & Information Officer", "Chief Operating Advisor", "Mobile App Developer"]
    let execDescriptionArray: [String] =
        [    "Zachia grew up surrounded by a large Afghan community in Southern California. However, it was upon joining the United Afghan Club at UCLA that she first started working with the diaspora, and she has not stopped since. Zachia has served on the AAC & AACO Committee since its founding and is inspired by the strength of her community.\n\nZachia is the Director of International Relations, Policy, & Protocol for Los Angeles Mayor Karen Bass. In her role, she strengthens the city's partnerships with the world. She received her BA in International Development Studies and Political Science from UCLA and her Master's in Public Policy and Management from Carnegie Mellon University.",
             
            "Raised in the Midwest without a substantial Afghan community, Dawoud's initial encounter at the Afghan-American Conference revealed an organization that genuinely empowered, supported, and engaged the Afghan community. That experience inspired him to join AACO and actively contribute to the fulfillment of its vision. Currently volunteering in his fourth year as the Chief Strategy Officer, Dawoud is driven by a desire to give back to the community, empowering community members, and building a strong and vibrant diaspora for generations to come.\n\nProfessionally, Dawoud serves as the Founder and CEO of The Winter Companies, a venture capital firm specializing in marketing and advertising technologies. Prior to founding the firm, he held executive roles in several companies, where he played a crucial role in overseeing the development and marketing of high-growth products that scaled to millions in monthly revenue, contributing to multiple successful acquisitions and exits for the companies.\n\nDawoud is currently pursuing his Master of Business Administration (MBA) degree from the Carlson School of Management, University of Minnesota, and earned his Bachelor’s degree in Computer Science, with a Minor in Music, from the University of Saint Thomas.",
             
             "Born in Kabul, Afghanistan, Sara came to the United States at the young age of 2.  She currently resides in Los Angeles, CA.  Throughout her life, she has been very involved with the Afghan-American community, taking on a variety of roles with community organizations.  Sara has been part of the AACO community since its inception in 2015, as a Conference Participant 2015-2017, Committee Member from 2018-2020, and now after a 2-year break has rejoined the AACO team.\n\nIn her professional career,  Sara is a Sr. Principal Success Manager at Slack, managing some of Slack's largest media customers.  She has over 15 years of experience in client/relationship, project and risk management with 10+ years of experience in the Management Consulting space",
             
             "Omar was born and raised in Los Angeles, where he has always been surrounded by his extensive Afghan family. His involvement with the Afghan-American community began during his undergraduate years at UCLA when he joined the United Afghan Club. This sparked a growing passion for being an active member in the community, which was further strengthened after attending the first Afghan-American Conference in 2015. Since then, he has been constantly seeking ways to stay involved. In 2018, he took his involvement a step further by designing and developing AACO’s first mobile application for iOS and Android.\n\nIn his professional career, Omar combines his passion for innovation and commitment to making a difference as Co-Founder and Chief Product Officer at Weeve, LLC, where he and his team designed the first ever AI chatbot for employee engagement. Omar also serves as a strategic workplace program manager at Amazon, where he leverages his expertise to create workplace strategies that are focused on technology and efficiency in the new work-from-home era."
    ]
 //   let execImageArray: [UIImage] = [
 //       UIImage(named: "committeeHeader")!
  //      ]
    
    let marketingNameArray: [String] = ["Omed Amin", "Shabnam Popal", "Alina Amilee", "Negina Pirzad", "Hila Hamidi"]
    let marketingTitleArray: [String] = ["Marketing Director", "Marketing Associate Director", "Head Of Design & Social Media", "Head Of Communications & Website", "Sub-Committee: Video Content Creator"]
    let marketingDescriptionArray: [String] =
        [
            "Omed grew up in Herndon, Virginia. Despite being raised in a hub for Afghan-Americans, the only Afghans Omed grew up around were his own family. It wasn’t until Omed joined his university’s Afghan Student Union and in 2017, AAC, that he felt like he had an Afghan community. After attending several AAC’s, Omed joined AACO in 2020, and has been the Marketing Director since 2021.\n\nOutside of AACO, Omed studied at George Mason University in Fairfax, Virginia where he received his Bachelor’s in Electrical Engineering and his Master’s in Systems Engineering. Omed currently works as a Senior Systems Engineer at The MITRE Corporation which operates Federally Funded Research and Development Centers in McLean, Virginia. In his free time, Omed enjoys playing the guitar, traveling, and video editing.",
            
            "Shabnam Popal is a first-generation Afghan-American who was born and raised in Fremont, California. Shabnam received her Bachelor of Science degree in Bio-Psychology from the University of California, Davis, and is currently a Masters of Business Administration Candidate at Simon Business School. During her time at UC Davis, Shabnam was an active member of the Afghan Student Association and served as President from 2018 to 2019. After attending AAC in 2022 held at her alma mater, Shabnam was inspired to join the Afghan-American Community Organization committee as the Associate Director of Marketing.\n\nShabnam is a results-driven, forward-thinking and multifaceted marketing leader with experience in diversity, equity & inclusion strategy and health equity initiatives. She has worked in the healthcare industry for over 5 years, and has most recently served as a Project Manager at a Fortune 500 biotechnology organization. Her broad-based lived experiences have allowed her to serve in a variety of different leadership positions across public, private and non-profit industries.",
            
            "Alina Amilee is an Afghan-American Bay Area, California native who is currently based in Southern California. Alina attends California State University, Fullerton as a Marketing major and serves as the Head of Social Media and Design for AACO. Inspired by her maternal grandfather’s role in academia and the current political climate in the motherland, she is passionate about the work AACO does to support Afghan youth in attaining a proper education with scholarships. She is proud and grateful to work with other intelligent young minds to push for more Afghan excellence.\n\nShe hopes to use her background in marketing, creativity as an artist, and entrepreneurial skills to create the best designs and marketing campaigns for AACO in order to increase exposure to the organization, so that more Afghan youth can acquire the opportunity for a better education and a sense of community.",
            
            "Negina Pirzad is a communications and brand marketing pro based in Portland, Oregon. Currently, she is the PR Manager of one of Williams-Sonoma, Inc.’s premier home furnishing brands, leading strategy for public relations, brand partnerships, and events. Since the start of her career, Negina has extensive experience in both B2B and B2C industries having worked with food, beverage, travel, and wellness brands. In her off time, she offers her skills to local small businesses and non-profits for freelance projects. Negina also serves on her company’s Equity Action Steering Committee, collaborating closely with community organizations assisting the immigrant, refugee, and BIPOC populations in Portland.\n\nNegina earned two Bachelor of Arts degrees from the University of Oregon in Journalism and International Studies with a focus in the Arabic language and region. In addition to Arabic, Negina speaks and has studied Dari and French.",
            
            "Born and raised in Southern California, Hila Hamidi is a television producer at Warner Bros. and runs a digital marketing agency based out of Orange County. Her passion for storytelling flourished at eleven when she visited Afghanistan for the first time. Dropping out of high school at sixteen to pursue a career in architecture, Hila quickly became her family’s disappointment by graduating from the University of Southern California with a degree in business and screenwriting. Shortly after, she redeemed herself by working with National Geographic, Warner Bros. Stage 13, Break the Room, and a Chuck Lorre sitcom with Warner Bros. over at CBS and now FOX. She also runs her blog called Hilastan, where she shares her travels and explores her hyphenated identity, working on bridging the gap between the east and west."
            ]
 //   let marketingImageArray: [UIImage] = [
     //   UIImage(named: "committeeHeader")!
   //     ]
    
    let opsNameArray: [String] = ["Darya Moini", "Omar Shokoor", "Hamza Yaqoobi", "Sofia Schersei", "Ali Saadat", "Yakub Niaz", "Bahman Hassan", "Sadaf Rohani"]
    let opsTitleArray: [String] = ["Operations Director", "Operations Associate Director", "Head of Community Projects", "Head Of Procurement & Logistics", "Head Of Hospitality", "Head of Technology & Workflows", "Sub-Committee: Assistant Head of Hospitality", "Sub-Committee: Assistant Head of Technology & Workflows"]
    let opsDescriptionArray: [String] =
        [
            "Darya hails from NY, found on the East-Coast, best coast. She grew up with a large extended family, but sometimes still felt lost and struggled with her dual identity. Attending AAC for the first time in 2018, her experience opened her eyes to a diaspora of like minded individuals who share a common identity. This motivated her to want to contribute and give back to not only her community in the Tri-State but on a national level. Darya joined the AACO committee back in 2021 and it has been her absolute privilege to work alongside such a passionate and dedicated community.\n\nDarya graduated from Hofstra Honors College with a degree in Political Science and minor in Economics. She works as an Operations Analyst who specializes in Financial Services Banking and Mid-Size Enterprise. In her free time she enjoys traveling, being a foodie,, being competitive at all games, outdoor activities, spending time with family, Marvel movies and being a coffee connoisseur.",
            
            "Omar Shokoor was born and raised in Fremont, California. Feeling inspired and motivated after attending AACO’s inaugural conference, he built community during college through MSAs and ASAs. He received a bachelor's degree in Managerial Economics from UC Davis. Currently, he is a strategy manager for Walmart E-commerce in San Francisco. He proudly serves as the Associate Director of Operations.",
            
            "Hamza, born in Afghanistan and raised in Utah, initially felt disconnected from his Afghan roots. However, his desire to bridge the gap led him to attend his first Afghan American Conference in 2018. Inspired by his experience, Hamza became a Committee Member of the Afghan-American Community Organization, where he now holds the position of Head of Community Projects, primarily overseeing the AACO Scholarship Program.\n\nAlongside his community involvement, Hamza serves as an Educator at the University of Utah, utilizing his extensive background in higher education to support college student success and retention. With a Bachelor of Science in Information Systems, Hamza is currently pursuing a Master of Education degree from the University of Utah.",
            
            "Sofia Schersei was born and raised in Frankfurt, Germany, until the age of fourteen. She currently lives in Sacramento, California, and serves as a Workplace Investigation Attorney for Vandermyden Makus Law Corporation. She received her bachelor's degree in Criminology, Law and Society with a minor in Nonprofit Studies from George Mason University and her Juris Doctorate from the University of the Pacific McGeorge School of Law.\n\nDuring her time at McGeorge, Sofia Schersei became a published student scholar with two peer-reviewed articles. During her last year, she became the first Woman of Color and Afghan American Editor-in-Chief of the 53rd Law Review overseeing a staff of thirty Staff Writers and Primary Editors. Under her leadership, the Law Review published over forty peer-reviewed scholarly articles by student and legal scholars. She also served as President of the Middle Eastern Student Law Association and mentored minority first-generation law students. Her proudest accomplishment was founding the first-ever diversity scholarship endowment program to help minority students study for the California bar to bridge the gap in passage rates between minority students and their counterparts. Outside her studies, she was involved with the Afghan Diaspora for Equity and Progress as an ADEP Fellow for two years.\n\nPreviously, Sofia served on the AAC Organizing Committee for two years as a subcommittee member under the Operations Team for the AAC conferences in 2018 and 2019. She returned as a cohort lead during the 2022 conference in Davis, California. Sofia is excited to return to the AACO Committee as the Head of Procurement and Logistics on our Operations Committee.",
            
            "Ali Saadat is a project manager for the Middle Eastern Student Center at UC Riverside. He was born and raised in Southern California to parents who immigrated from Herat, Afghanistan. He is passionate about working in community spaces and providing opportunities for young people from SWANA backgrounds. In his free time, he enjoys being disappointed by the Los Angeles Lakers, Buffalo Bills, and Chelsea FC.",
            
            "Yakub Niaz is a senior at the University of St. Thomas in St. Paul, where he is majoring in Data Analytics with a focus on Actuarial Science and minoring in Mathematics, Chemistry, and Statistics. He has gained practical experience in the field through his work as an Automation Intern at SkyWater Technology since July 2021.",
            
            "Bahman was born in and raised in Queens, NY. He has a large family and network of Afghans within his community. Due to his exposure with a large network of Afghans, he grew up being passionate about culture and giving back to his community. After attending AAC for the first time, Bahman knew he wanted to be a part of a platform that not only brings people together, but helped him understand his own identity. Since attending AAC, Bahman has contributed back to his community in various ways. Whether it was partaking in social justice and organizing protests throughout NYC, or bringing community together socially in hosting gatherings to have conversations with fellow AAC alumni.\n\nBahman has his Bachelors in Business Administration from DeSales University. Since graduating, began his career in management with various fast food chains. Surely enough, Bahman found himself back in Queens wanting to further his career, and re-visit his strong ties to the community there. Currently Bahman works as a Department Manager for Nordstrom. In his free time Bahman enjoys traveling, trying new foods and bowling. He hopes by joining the AACO committee he can help navigate new attendees in finding a common community, and strengthening their ties to their own Afghan identity.",
            
            "Sadaf spent her childhood in Queens, NY and Northern Virginia, where she was surrounded by a large extended family. After attending AACO’s  first virtual conference, she became even more dedicated to giving back to the community and joined the AACO team. Sadaf received her Bachelor's degree in Neuroscience with a minor in Psychology from George Mason University, along with a Master's degree in Data Analysis and Applied Statistics from Virginia Tech. Currently, she works as a Data Scientist for the federal government. In her free time, she enjoys reading, hiking, and traveling."
            ]
   // let opsImageArray: [UIImage] = [
  //      UIImage(named: "committeeHeader")!
   //     ]
    
    let programmingNameArray: [String] = ["Yosef Mahmood", "Robia Qasimyar", "Aresh Ramin", "Nadeema Safi", "Silgai Mohmand", "Sabrina Zarifi", "Mariam Mahbob", "Amina Seddiq"]
    let programmingTitleArray: [String] = ["Programming Director", "Programming Associate Director", "Head Of Community Programming", "Head Of Talent Acquisition & Support", "Programming Coordinator", "Programming Coordinator", "Sub-Committee: Assistant Programming Coordinator", "Sub-Committee: Assistant Programming Coordinator"]
    let programmingDescriptionArray: [String] =
        [
            "Yosef Mahmood is a proud Halfgan, born and raised in Fresno, CA, where he grew up largely separated from the larger Afghan-American diaspora.  Since attending his first Conference in 2016, Yosef has renewed his connection with his cultural identity and found his community.  Yosef now lives in Los Angeles in multi-cultural wedded bliss with his Half Armenian wife, Nicole.  He is thrilled to have this opportunity to give back and lead the Conference that has given him so much.\n\nYosef currently serves as a Deputy City Attorney at the Los Angeles City Attorney's Office, where he litigates consumer protections cases. Prior to entering public service, he was a Litigation Associate at Kirkland & Ellis LLP. Yosef attended Fresno State for his undergraduate degree, where he earned the Dean's Medal from the College of Arts & Humanities, and UCLA for his J.D., where he graduated Order of the Coif. In law school, Yosef also served on the Moot Court Honors Board and was the Editor-In-Chief of the UCLA Journal of Environmental Law and Policy.",
            
            "Robia proudly represents the Midwest, baby. She is passionate about serving others and advocating for those in need, which led her to pursue Bachelor of Science in Psychology and Master of Public Administration degrees. While her previous experience includes positions in higher education at the university level, Robia currently works in philanthropy, supporting local organizations that promote racial justice and social equity. In her free time, Robia enjoys getting lost in novels, defending her Hogwarts House (Slytherin), and watching Turkish dramas and Bollywood movies – her dil dolas for SRK.",
            
            "Aresh was born and raised in Brooklyn, NY. His entire family moved out to Lehigh Valley, Pennsylvania during his high school years and now he calls it home. He grew up in a large Afghan family, but he didn’t have an Afghan community outside of that. Growing up as an Afghan-American, he faced the struggles of his family never understanding his life as an American and his friends never understanding his life as an Afghan. The Afghan-American Conference gave him the community that he was looking for and allowed him to create friendships with individuals that shared that same hyphenated identity.\n\nAresh graduated with a B.S. in Biology from Pennsylvania State University and graduated with a M.D. from the University of South Florida. He completed his residency training in Emergency Medicine from the Montefiore Health System. Aresh currently resides in the Bronx and works for NYC Health + Hospitals. He is an attending physician at the Jacobi Medical Center and North Central Bronx Hospital. He is also an Assistant Professor at the Albert Einstein College of Medicine where he teaches clinical medicine to first year medical students.",
            
            "Born in Queens, NY but raised in Denver, CO, Nadeema grew up feeling isolated from the small community of Afghans that surrounded her. It wasn’t until she entered high school that she became more confident in her unique Afghan-American identity.  She feels lucky that her parents raised her in a fashion that allowed her to keep her Afghan roots and traditions alive while living in a region that lacked extensive representation. Nadeema is a proud recipient of the 2020 AACO Scholarship, which sparked her interest in joining the larger committee. Ever since becoming a committee member, she has developed a stronger connection with the Afghan-American community–something that she has always yearned for.\n\nNadeema graduated from the University of Colorado Denver after pursuing her Bachelor of Science degree in Public Health and currently resides in Northern Virginia. She proudly utilizes the knowledge she has gained throughout the years with her clinical experiences and ties them to the world of cyber security and intelligent data mining within her current role. On the weekends, you can find Nadeema scoping out new coffee shops in the DMV.",
            
            "Silgai Mohmand is Deputy Public Defender at the Orange County Public Defender’s Office. She provides legal representation to those unable to financially afford legal services. She was born and raised in So-Cal. She is also one of the co-founders of Muslawmah, an online platform  dedicated to empowering and supporting Muslim women in the legal field. She is also involved in various Afghan and Muslim communities in So-Cal. Silgai earned her J.D. from Chapman University, Fowler School of Law and received a bachelor’s degree in Economics from University of California, Irvine. During law school, she was a merit scholar and awarded the Joann Leatherby Leadership Award for Women in the Law. Some of her activities included serving as the Editor-In-Chief of her school’s Diversity and Social Justice Forum and President of the Muslim Law Student Association.",
            
            "Sabrina Zarifi born and raised in Los Angeles, CA, currently based out of Washington, DC. earned a strong educational background and a diverse range of experiences. Holding a Master of Studies in Law (MSL) from the University of Southern California (USC), Gould School of Law. Sabrina has developed a solid foundation in the legal field and has expanded their skill set by obtaining a Digital Marketing Strategies: Data, Automation, AI & Analytics Certificate from Northwestern University's Kellogg School of Management. Currently serving as a Programs Associate at Innovation Research Interchange (IRI) Programs, a division of the National Association of Manufacturers (NAM). She has successfully cultivated and maintained strong relationships with diverse partners, fostering knowledge-sharing and collaboration on critical issues. Through her contributions, Sabrina has played a pivotal role in facilitating engagement and garnering positive feedback from participants involved in various initiatives.",
            
            "Mariam Mahbob was born and raised in New York City. Currently she is a Clinical Trial Manager for Promontory Therapeutics Inc., an early stage biotech focused on developing novel immunogenic therapies in the oncology space.\n\nPreviously she has worked in the clinical oncology research space in various capacities at academic research hospitals such as Memorial Sloan Kettering Cancer Center and North Shore University Hospital, as well as startup companies, such as TrialSpark. She received a bachelor’s degree in Neuroscience from the University of Pennsylvania and will be pursuing her Master’s in Business Administration from Columbia University this fall where she plans to supplement her science background with the business and entrepreneurial skills needed to grow and lead teams at a big pharma company.",
            
            "Amina Seddiq was born in Northern Virginia and spent her childhood around NoVA, briefly in Long Island and in UAE. After graduating high school in Dubai, she received her Bachelor’s in Immunology and Master of Social Work at the University of Edinburgh in Scotland. Amina returned to NoVA right before the pandemic working as a case manager at a women’s shelter in Anacostia DC. After which she worked as a psychotherapist for children, families and adults.\n\nAfter nearly 10 years abroad, Amina felt detached from her Afghan community. Throughout the pandemic, she wished to connect with Afghans beyond her own sizable family in Northern Virginia. Amina was finally able to do so last year by attending the 2022 Conference in Davis, CA. The connections she made at the conference surpassed her expectations. Amina hopes by joining the committee she can help further strengthen the bonds within our community created via AACO."
            ]
  //  let programmingImageArray: [UIImage] = [
   //     UIImage(named: "committeeHeader")!
   //     ]
    
   

    let bodNameArray: [String] = ["Mohammad Ali Azizi-Sultan", "Madina Nooristani", "Farhat Hanifi", "Homaira Hosseini", "Spojmie Nasiri", "Atia Abawi", "Ryhan Futuri"]
    let bodTitleArray: [String] = ["Board Of Directors Chair", "Board Of Directors", "Board Of Directors", "Board Of Directors", "Board Of Directors", "Board Of Directors", "Board Of Directors"]
    let bodDescriptionArray: [String] =
        [
            "Born in Kabul, Afghanistan, Dr. Mohammad Ali Aziz-Sultan embarked on his lifelong commitment to health and innovation after receiving his Medical Degree at the George Washington University School of Medicine. Dr. Sultan proceeded to complete his Neurosurgical Residency with an in-folded Radiology Fellowship at the University of Miami, followed by two Fellowships at the Barrow Neurological Institute in Phoenix Arizona (one in Endovascular Neurosurgery and the other in Cerebrovascular and Skull Base Surgery). Respected among peers and understanding the importance of innovation, Dr. Sultan quickly advanced to the position of Associate Professor of Neurosurgery and Director of Endovascular Surgery at the University of Miami Miller School of Medicine. Opportunity giving way to present day, Dr. Sultan currently holds the title of Associate Professor of Neurosurgery at the Harvard Medical School, and Chief of Vascular and Endovascular Neurosurgery at Brigham and Women’s Hospital, all the while pursuing a degree in Master of Business Administration at the Massachusetts Institute of Technology which he completed in the Spring of 2019.\n\nDr. Sultan’s most impactful contributions have been in the field of education. He has published over 120 peer-reviewed articles and book chapters and is an ad hoc editor for several of the most prominent neurosurgical publications. He has been involved in training of over 60 residents 25 fellows in neurosurgery and currently serves as the associate program director for the residency at Brigham.  Most of the fellows that have trained with him have gone into academic programs and are now training other physicians. He is an invited speaker at most of the national and international cerebrovascular conferences.  He has also used his platform at Harvard to tell his story as a young Afghan refugee who fled a war torn country at the age of six to eventually come to the United States. The opportunities afforded by education has allowed him to practice medicine in an unparalleled environment. He has given these stories of hope and resilience of the Afghan people as invited professor at Universities and to the Afghan-American Conference aimed towards youth empowerment.  He has also returned to his homeland on a few occasions to help collaborate with neurosurgeons in Kabul Afghanistan in service to the Afghan community.",
            
            "Madina Nooristani was born in Kabul, Afghanistan and raised in New York. Madina has worked on Wall Street at AIG as an Actuary for 12 years and as a Finance Manager at S&P Global.\n\nCurrently, she is a Product Manager for a startup named Branch Financial, and she is based in Southern California. She graduated from New York University, Stern School of Business with a major in Actuarial Science, Finance and minor in Mathematics. Madina has served on the AAC Organizing Committee for 6 years as the Finance Lead and on the Executive Team. She now proudly serves our diaspora and Afghanistan on the Afghan-American Community Organization Board of Directors.",
            
            "Farhat Hanifi serves as the Director of Philanthropy for the Waterford Foundation where she oversees the implementation and execution of domestic and international projects that serve under-resourced communities.\n\nShe is a founding board member for the Valley Health Education Foundation, a non-profit dedicated to promoting access to higher education in health sciences and related fields in the San Joaquin Valley of California. Farhat was a founding committee member of the Afghan-American Conference and served as the Finance Co-chair for the first three years of its inception. She is also a proud Bruin and graduated from UCLA with a degree in Anthropology. Farhat presently lives in Fresno, California with her wonderful husband and amazing kids.",
            
            "Homaira Hosseini was born in Herat, Afghanistan and raised in Fremont, California. Currently, she is Litigation Counsel for Lyft in San Francisco.\n\nPreviously, she was a Litigation Associate at Morgan Lewis & Bockius. Homaira is barred in both California and Texas. Homaira completed a Coro Public Policy Fellowship in San Francisco. She received a bachelor's degree in Political Science and Public Affairs from UCLA and a J.D. from Berkeley Law School where she was honored as a Paul & Daisy Soros Fellow. Homaira served on the AAC Organizing Committee for 3 years as the Professional Networking Coordinator and Community Initiatives Chair. She now proudly serves as Chair of the Afghan-American Community Organization Board of Directors.",
            
            "Spojmie Nasiri is a first-generation immigrant and founder of the Law Office of Spojmie Nasiri, a minority owned law firm in Pleasanton, California.\n\nMrs. Nasiri received her Bachelor of Arts degree in Political Science from the University of California, Davis and her Juris Doctorate from Golden Gate University, School of Law. Mrs. Nasiri assists clients with a wide variety of immigration matters, including applications with the consulates and U.S. Citizenship and Immigration Services, representing clients detained by the Department of Homeland Security, defending immigrants in removal proceedings in Immigration Court. Mrs. Nasiri has been a member of the California State Bar since 2006 and is admitted to practice before the California Supreme Court and the U.S. District Court for Northern California. She is currently a member of the American Immigration Lawyers Association. She served as President of the Council on American Islamic Relations (CAIR) for the San Francisco Bay Area Chapter from 2015 to 2018. Mrs. Nasiri is also co-founder and president of We Have Hope Foundation. She was inducted into the Alameda County Women’s Hall of Fame in 2019 for her immigration related work in the community. Mrs. Nasiri is fluent in Pashto and Dari.",
            
            "Atia Abawi is a foreign correspondent and author now based in Los Angeles, California after spending more than a decade living in Afghanistan and the Middle East. She currently serves as an International Affairs analyst for NBC News.\n\nAbawi was born a refugee to Afghan parents in West Germany and was raised in the United States. She graduated from Virginia Tech with a degree in Communications and International Studies, and was awarded the school’s Outstanding Alumna honor. Abawi went on to work for CNN, NBC News, and Al Jazeera English as a foreign news correspondent. She has covered stories from all over the world. Abawi was stationed for almost five years in Kabul, Afghanistan, before moving to Jerusalem in 2013. She has won numerous awards for both her journalistic achievements and written, including The George Foster Peabody Award and The duPont-Columbia Awards.\n\nHer first book, “The Secret Sky: A Novel of Forbidden Love in Afghanistan” was published by Penguin Books in 2014. Her next novel, “A Land of Permanent Goodbyes” based on the Refugee Crisis was released by Penguin Random House in 2018. Atia’s latest book released in March 2021 and is a part of Chelsea Clinton’s ‘She Persisted’ Series in which she profiled Sally Ride.",
            
            "Ryhan Futuri is Director and Head of the U.S. Centurion Card (The Black Card) at American Express. Ryhan leads a team that manages all aspects of the portfolio including value proposition, benefits, customer experience and marketing, finance, and the long term strategy of Amex’s most premium, luxury product.\n\nPrior to this role, Ryhan has served in a variety of leadership positions at Amex including roles in strategy, marketing, and customer experience. Prior to American Express, Ryhan worked as a strategy consultant servicing Fortune 500 brands in the U.S, Europe, and Africa.  Ryhan has an MBA from Georgetown University, a BBA from The George Washington University, and a Continue Education Certification in Economics and Luxury Brands from Bocconi University in Milan. Ryhan is from Fairfax, Virginia and resides in New York City. He proudly serves as Board of Director of the Afghan-American Community Organization."
            ]
   // let bodImageArray: [UIImage] = [
   //     UIImage(named: "committeeHeader")!
    //    ]
    
    let ccNameArray: [String] = ["Alexandra Millatmal", "Dawoud Waziri", "Madina Wardak"]
    let ccTitleArray: [String] = ["Code of Conduct Coordinator", "Code of Conduct Coordinator", "Code of Conduct Coordinator"]
    let ccDescriptionArray: [String] =
    ["A product of the small-town Midwest, Alex has always been a 'half-ghan'; feeling neither here nor there. While her undergraduate studies gave her the vocabulary to better understand and challenge her view of herself and the world, spending time with her family in Kabul and Jalalabad gave her a basis from which to define her own hyphenated experience. Since that impetus, she’s engaged more deeply in diasporic community as a cohort member of AAAWA’s inaugural Afghan Literary Futures workshop, a presenter at the Afghan-American Conference in 2020 and 2019, and a former member of Ajam Media Collective’s digital archive team. As a software engineer at Newsela, an education tech company, Alex writes code that allows editorial teams to create and publish complex curricula centered on real-world content, like breaking news. She came to coding from an award-winning career in journalism, where she structured online conversations around international politics. Alex finds herself preoccupied with feminisms, liminality, and critique of liberal-secular space and discourse. She lives in Bed-Stuy, Brooklyn with her cats, Shamousa and BAMF.",
   
     "Dawoud Waziri was born and raised in Northern Virginia and has been in Southern California since 2006. He’s currently working as a sales manager, as well as being one of the founders of The Samovar Network, a progressive and inclusive Afghan diasporic hub. That fosters honest conversations that center the marginalized, reinvigorate culture, and build community.",
     
     "Madina Wardak MSW/ACSW is a social worker, consultant, trainer and facilitator based out of Los Angeles, CA. Madina received a Bachelors in Political Science with an emphasis on the Middle East from UC Irvine and a Masters in Social Work from the University of Southern California. Madina has served foster youth experiencing housing instability since 2018 at both Covenant House California and First Place For Youth. She has been involved in grassroots organizing through SWANA-LA since 2015. Madina has previously served as a facilitator for various workshops at the Afghan American Conference regarding identity, mental health and substance abuse. Since the withdrawal of American troops from Afghanistan, she has served as a trainer and facilitator, consulting social service agencies serving Afghan refugees. She is the founder of Burqas & Beer, an online digital platform discussing Afghan mental health, intergenerational trauma, political issues, identity, and socio-cultural events. Most recently, her poetry was featured in the Afghan American Artists & Writers written anthology, 'EMERGENC(Y): Writing Afghan Lives Beyond the Forever War.'"
    ]
   /// let ccImageArray: [UIImage] = [
      //  UIImage(named: "committeeHeader")!
   //     ]
    
    let mhNameArray: [String] = ["Nilo Sidiqi"]
    let mhTitleArray: [String] = ["Mental Health Advisor"]
    let mhDescriptionArray: [String] =
    ["Nilo Sidiqi is a practicing School Psychologist  and Associate Marriage Family Therapist in Northern California. She received her Bachelors of Arts degree in Psychology and a Minor in Education from the University of California Davis and her Master of Science degree in Counseling from California State University East Bay. She has a passion for working with children with disabilities and providing equitable services in the school setting. She is a strong advocate for bringing access to mental health services to the Afghan community and Muslim community as a whole. She was a member of the CARE Team for the 2022 Afghan American Conference."]
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
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return execNameArray.count//13
        case 2:
            return opsNameArray.count
        case 3:
            return programmingNameArray.count
        case 4:
            return marketingNameArray.count
        case 5:
            return bodNameArray.count
        case 6:
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
            label.text = "Executive Team"
        }
        else if section == 2 {
            label.text = "Operations Team"
        }
        else if section == 3 {
            label.text = "Programming Team"
        }
        else if section == 4 {
            label.text = "Marketing Team"
        }
        else if section == 5 {
            label.text = "Board of Directors"
        }
        else if section == 6 {
            label.text = "Conduct Coordinators"
        }
        else {
           label.text = "Mental Health Advisor"
        }
        label.backgroundColor = .white
        return label

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as? CommitteeDescriptionCell else {
                return UITableViewCell()
            }
            
            cell.committeeDescription.text = "The Afghan-American Conference started as an idea implemented by a group of 8 students and working professionals volunteering remotely from across the United States. After scaling beyond the conference to a non-profit with various focus areas, the AACO team has also scaled. Today, AACO is composed of 25 Committee Members across 4 teams, 7 Board of Directors, 1 Mental Health Advisor and 3 Code of Conduct Coordinators. The four committees include the Executive team, Marketing, Operations, and Programming.\n\nOur team comprises diverse individuals who hold a deep passion for our community, a commitment to service, and unique personal and professional experiences, to which all of whom seek to advance AACO's vision of building a supportive, empowered, and engaged Afghan-American community.\n"
            
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
        }
        else if indexPath.section == 2 {
            name = opsNameArray[indexPath.row]
            title = opsTitleArray[indexPath.row]
        }
        else if indexPath.section == 3 {
            name = programmingNameArray[indexPath.row]
            title = programmingTitleArray[indexPath.row]
        }
        else if indexPath.section == 4 {
            name = marketingNameArray[indexPath.row]
            title = marketingTitleArray[indexPath.row]
        }
        else if indexPath.section == 5 {
            name = bodNameArray[indexPath.row]
            title = bodTitleArray[indexPath.row]
        }
        else if indexPath.section == 6 {
            name = ccNameArray[indexPath.row]
            title = ccTitleArray[indexPath.row]
        }
        else if indexPath.section == 7 {
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
         }
         else if indexPath.section == 2 {
             name = opsNameArray[indexPath.row]
             title = opsTitleArray[indexPath.row]
         descp = opsDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 3 {
             name = programmingNameArray[indexPath.row]
             title = programmingTitleArray[indexPath.row]
         descp = programmingDescriptionArray[indexPath.row]
         }
        else if indexPath.section == 4 {
            name = marketingNameArray[indexPath.row]
            title = marketingTitleArray[indexPath.row]
        descp = marketingDescriptionArray[indexPath.row]
        }
         else if indexPath.section == 5 {
             name = bodNameArray[indexPath.row]
             title = bodTitleArray[indexPath.row]
         descp = bodDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 6 {
             name = ccNameArray[indexPath.row]
             title = ccTitleArray[indexPath.row]
         descp = ccDescriptionArray[indexPath.row]
         }
         else if indexPath.section == 7 {
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
