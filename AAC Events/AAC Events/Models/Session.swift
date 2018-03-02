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
        
        //TODO: fill out above variables,
            //sub items in the session will have to be set after each session in concurrentSessions is parsed
    }

    func findSessionForID(searchID:String) -> Session? {
        
        for session in  allFridaySessions {
            if session.id == searchID {
                return session
            }
        }
        for session in  allSaturdaySessions {
            if session.id == searchID {
                return session
            }
        }
        for session in  allSaturdaySessions {
            if session.id == searchID {
                return session
            }
        }
        return nil
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
    
    var subIDs: [String]?
    
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


