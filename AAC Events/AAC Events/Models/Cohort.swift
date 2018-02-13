//
//  Cohort.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/11/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class Cohort: NSObject {
    
    var title: String
    var peopleArray: [CohortPerson]

    init?(cohortDict: JsonDict) {
        if let tit = cohortDict["title"] as? String {
            self.title = tit
        } else { return nil }
        
        var people: [CohortPerson] = []
        if let peeps = cohortDict["peopleArray"] as? [JsonDict] {
            for person in peeps {
                if let cohPerson = CohortPerson(person: person) {
                    people.append(cohPerson)
                }
            }
            self.peopleArray = people
        } else {
            return nil
        }
    }
}

class CohortPerson: NSObject {
    
    var name: String
    var imageURL: String
    
    init?(person: JsonDict) {
        if let personName = person["name"] as? String {
            self.name = personName
        } else {
            return nil
        }
        if let imgURL = person["imageURL"] as? String {
            self.imageURL = imgURL
        } else {
            return nil
        }
    
        
    }
}
