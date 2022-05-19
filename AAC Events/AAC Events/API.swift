//
//  API.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/07/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import Foundation
import UIKit

typealias JsonDict = Dictionary<String, AnyObject>

let attendeesURL = "https://dl.dropboxusercontent.com/s/ti105fzidyc8vc4/Attendees.json?dl=0"
let normsURL = "https://dl.dropboxusercontent.com/s/mikmzq6g9o8ss78/Norms.json?dl=0"
let cohortsURL = "https://dl.dropboxusercontent.com/s/yoxo4gjgo4vpm26/CohortsData.json?dl=0"
let peopleURL = "https://dl.dropboxusercontent.com/s/wu5ivui6ws6chtw/PeopleList.json?dl=0"
let sponsorsURL = "https://dl.dropboxusercontent.com/s/uby6iprsz9no1sa/SponsorsData.json?dl=0"
let agendaURL = "https://dl.dropboxusercontent.com/s/piavrsxzyp929lr/AgendaData.json?dl=0"

class API: NSObject {

    
    private func createRequest(baseURL: String) -> URLRequest? {
        
        guard let completeURL = URL(string: baseURL) else {
            print("unable to create URL with: \(baseURL)")
            return nil
        }
        
        var request = URLRequest(url: completeURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        return request
    }
    
    private func retrieveData(url: String, callback: @escaping ((AnyObject?, Error?) -> ())) {
        
        guard let request = createRequest(baseURL: url) else {
            callback(nil, nil)
            return
        }
        
        print("*** Request:\(String(describing: request.url?.absoluteString))")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
                callback(nil, error)
            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse!)
                
                guard let responseData = data else {
                    print("no response data")
                    callback(nil, error)
                    return
                }
                do {
                    guard let jsonReponse = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as Any? else {
                        callback(nil,error)
                        return
                    }
                    callback(jsonReponse as AnyObject, nil)
                    print(jsonReponse)
                } catch {
                    print("couldn't serialize json")
                    callback(nil, error)
                }
            }
        })
        
        dataTask.resume()
    }
    //    func retrieveData(url: String, callback: @escaping ((AnyObject?, Error?) -> ())) {

    func retrieveAttendees(callback: @escaping (([String]?) -> ())) {

        retrieveData(url: attendeesURL) { (jsonResponse, error) in
            if error == nil {
                //parse json
                print(jsonResponse!)
                guard let dict = jsonResponse as? JsonDict else {
                    print("couldn't create dictionary")
                    callback(nil)
                    return
                }
                guard let arrayOfNames = dict["names"] as? [String] else {
                    print("not a string array")
                    callback(nil)
                    return
                }
                callback(arrayOfNames)

            } else {
                print(error!.localizedDescription)
                callback(nil)
            }
        }
    }
    
    func retrieveCohorts (callback: @escaping (([Cohort]?, String?) -> ())) {
        
        retrieveData(url: cohortsURL) { (jsonResponse, error) in
            if error == nil {
                //parse json
                print(jsonResponse!)
                guard let dict = jsonResponse as? JsonDict else {
                    print("couldn't create dictionary")
                    callback(nil, nil)
                    return
                }
                let evalLink = dict["evaluationLink"] as? String
                
                guard let cohortsDict = dict["cohorts"] as? [JsonDict] else {
                    print("not a cohort array")
                    callback(nil, nil)
                    return
                }
                var cohortsArray: [Cohort] = []
                
                for cohortDict in cohortsDict {
                    if let currentCohort = Cohort.init(cohortDict: cohortDict) {
                        cohortsArray.append(currentCohort)
                    }
                    
                }
                
                callback(cohortsArray, evalLink)
                
            } else {
                print(error!.localizedDescription)
                callback(nil, nil)
            }
        }
    }
    
    func retrieveNorms(callback: @escaping ((NSAttributedString?) -> ())) {
        
        retrieveData(url: normsURL) { (jsonResponse, error) in
            if error == nil {
                //parse json
                print(jsonResponse!)
                guard let dict = jsonResponse as? JsonDict else {
                    print("couldn't create dictionary")
                    callback(nil)
                    return
                }
                guard let norms = dict["norms"] as? [JsonDict] else {
                    print("not a string array")
                    callback(nil)
                    return
                }
//                callback(arrayOfNames)
                let runningAttrString = NSMutableAttributedString()
                
                let titleFont = UIFont(name: "Montserrat-SemiBold", size: 15)
                let descriptionFont = UIFont(name: "Montserrat-Light", size: 15)
                
                let titleAttributes = [NSAttributedStringKey.font: titleFont]
                let descriptionAttributes = [NSAttributedStringKey.font: descriptionFont]
                
                for norm in norms {
                    var title = ""
                    var descriptionStrings:[String] = []
                    var isBullet = false
                    
                    title = norm["title"] as! String
                    title.append("\n")
                    
                    isBullet = norm["isBullet"] as! Bool
                    
                    let titleAttrString = NSAttributedString(string: title, attributes: titleAttributes)
                    runningAttrString.append(titleAttrString)
                    
                   

                    var runningDescAttrString = NSMutableAttributedString()
                    descriptionStrings = norm["description"] as! [String]

                    for var currentDescString in descriptionStrings {
                        if isBullet {
                            currentDescString = ("• ") + currentDescString
                        }
                        currentDescString.append("\n\n")
                        let currentDescAttrString = NSAttributedString(string: currentDescString, attributes: descriptionAttributes)
                        runningDescAttrString.append(currentDescAttrString)
                        
                    }
                    runningAttrString.append(NSAttributedString(string: "\n"))
                    runningAttrString.append(runningDescAttrString)
//                    let attributes = [NSAttributedStringKey.font: titleFont,
//                                      NSAttributedStringKey.foregroundColor: UIColor.white]                    let titleAttr = NSAttributedString(string: title, attributes: NSDictionary(
//                        object: titleFont!,
//                        forKey: NSAttributedStringKey.font))
                    
                    
                }
                
                callback(runningAttrString)
                
            } else {
                print(error!.localizedDescription)
                callback(nil)
            }
        }
    }
    
    func retrievePeople(callback: @escaping (([PeopleList]?) -> ())) {
        
        let appD = UIApplication.shared.delegate as! AppDelegate
        
        if appD.allPeople != nil {
            callback(appD.allPeople!)
        }
        
        retrieveData(url: peopleURL) { (jsonResponse, error) in
            if error == nil {
                //parse json
                print(jsonResponse!)
                guard let dict = jsonResponse as? [JsonDict] else {
                    print("couldn't create dictionary")
                    callback(nil)
                    return
                }
                
                var returningPeopleList: [PeopleList] = []
                
                for currentDict in dict {
                    if let list = PeopleList.init(dict: currentDict) {
                        returningPeopleList.append(list)
                    }
                    
                }
                appD.allPeople = returningPeopleList
                callback(returningPeopleList)
                
                
            } else {
                print(error!.localizedDescription)
                callback(nil)
            }
        }
    }
    
    func retrieveSponsors(callback: @escaping ((AllSponsors?) -> ())) {
        
        retrieveData(url: sponsorsURL) { (jsonResponse, error) in
            if error == nil {
                //parse json
                print(jsonResponse!)
                guard let dict = jsonResponse as? JsonDict else {
                    print("couldn't create dictionary")
                    callback(nil)
                    return
                }
                
                callback(AllSponsors(dict: dict))
                
                
            } else {
                print(error!.localizedDescription)
                callback(nil)
            }
        }
    }
    
    func retrieveAgenda() {
        
        retrieveData(url: agendaURL) { (jsonResponse, error) in
            if error == nil {
                //parse json
                print(jsonResponse!)
                guard let dict = jsonResponse as? JsonDict else {
                    print("couldn't create dictionary")
                    return
                }
                DispatchQueue.main.async {
                    let agenda = AllSessions(dict: dict)
                    let dele = UIApplication.shared.delegate as! AppDelegate
                    dele.allSessions = agenda
                    NotificationCenter.default.post(name: .agendaDownloadComplete, object: nil)
                    if let eval = dict["conferenceEvalLink"] as? String {
                        dele.conferenceEvaluationLink = eval
                    }
                }
                
            } else {
                print(error!.localizedDescription)
            }
        }

        
    }

}


extension Notification.Name {
    static let agendaDownloadComplete = Notification.Name(
        rawValue: "agendaDownloadComplete")
}






