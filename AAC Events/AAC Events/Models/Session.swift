//
//  Session.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/11/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class AllSessions: NSObject {
    var dateRange: String!
    
    var allFridaySessions: [Session]!
    var allSaturdaySessions: [Session]!
    var allSundaySessions: [Session]!
    
    
    init?(dict: JsonDict) {
        super.init()
        
        if let dates = dict["dateRange"] as? String {
            self.dateRange = dates
        } else { return nil }
        
        if let days = dict["sessionDays"] as? [JsonDict] {
            for day in days {
                if let dayString = day["dayString"] as? String {
                    switch dayString {
                    case "Friday":
                        allFridaySessions = parseWholeDay(day: day)
                        print("friday")
                        break
                    case "Saturday":
                        allSaturdaySessions = parseWholeDay(day: day)
                        print("saturday")
                        break
                    case "Sunday":
                        allSundaySessions = parseWholeDay(day: day)
                        print("sunday")
                        break
                    default:
                        print("incorrect day string in session json")

                    }
                    
                } else { return nil }
            }
        } else { return nil}
    }


    func findSessionForID(searchID:String) -> (Session?, Int?) {
        
        for session in  allFridaySessions {
            if session.id == searchID {
                return (session, 0)
            }
        }
        for session in  allSaturdaySessions {
            if session.id == searchID {
                return (session, 1)
            }
        }
        for session in  allSundaySessions {
            if session.id == searchID {
                return (session, 2)
            }
        }
        return (nil, nil)
    }
    
    func parseWholeDay(day: JsonDict) -> [Session] {
        var sessionsArray:[Session] = []
        
        if let daySessions = day["sessions"] as? [JsonDict] {
            for concurentSessionDict in daySessions {
                if let concSessions = concurentSessionDict["concurrentSessions"] as? [JsonDict] {
                    let firstItem = Session.init(dict: concSessions[0])
                    firstItem?.isSubItem = false
                    if concSessions.count > 1 {
                        var concurrentSessions:[Session] = []
                        //have subitems so need to create items and add the ids to first item
                        var subItemIDS:[String] = []
                        for i in 1...(concSessions.count-1) { //start at second item
                            if let subSession = Session.init(dict: concSessions[i]) {
                                subItemIDS.append(subSession.id)
                                subSession.isSubItem = true
                                concurrentSessions.append(subSession)
                            }
                        }
                        firstItem?.subIDs = subItemIDS
                        concurrentSessions.insert(firstItem!, at: 0)
                        sessionsArray.append(contentsOf: concurrentSessions)
                        
                    } else {
                        sessionsArray.append(firstItem!)
                    }
                }
            }
        }
        return sessionsArray
    }
}

class Session: NSObject {

    var title: String!
    var location: String!
    var sessionDescription: String!
    var startDate: Date?
    var endDate: Date?
    var id: String!
    var evaluationURL: String?

    
    //data not from json
    var isExpandable: Bool {
        if subIDs != nil && subIDs!.count > 0 {
            return true
        }
        return false
    }
    var isExpanded = false
    var subIDs: [String]?
    var isSubItem = false
    
    init?(dict: JsonDict) {
        
        if let theID = dict["id"] as? String {
            self.id = theID
        } else { return nil }

        if let tit = dict["title"] as? String {
            self.title = tit
        } else { return nil }
        
        if let loc = dict["location"] as? String {
            self.location = loc
        } else { return nil }

        if let loc = dict["description"] as? String {
            self.sessionDescription = loc
        } else { self.sessionDescription = "" }

        if let start = dict["startDate"] as? String {
            self.startDate = Date(timeIntervalSince1970: TimeInterval(Double(start)!))
        } else {
            self.startDate = Date.distantPast
        }
        
        if let end = dict["endDate"] as? String {
            self.endDate = Date(timeIntervalSince1970: TimeInterval(Double(end)!))
        } else {
            self.endDate = Date.distantPast
        }
        
        if let evalString = dict["evaluationURL"] as? String {
            self.evaluationURL = evalString
        } else { self.evaluationURL = "" }
            }
}


