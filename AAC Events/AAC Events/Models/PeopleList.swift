//
//  PeopleList.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/11/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class PeopleList: NSObject {

    var peopleTitle: String
    var peopleArray: [Person]
    
    init?(dict: JsonDict) {
        if let tit = dict["peopleTitle"] as? String {
            self.peopleTitle = tit
        } else { return nil }
        
        var people: [Person] = []
        if let peeps = dict["peopleArray"] as? [JsonDict] {
            for person in peeps {
                if let pers = Person(person: person) {
                    pers.title = self.peopleTitle
                    people.append(pers)
                }
            }
            self.peopleArray = people
        } else {
            return nil
        }
    }
}

class Person: NSObject {
    
    var name: String!
    var title: String!
    var imageURL: String!
    var personDescription: String!
    var sessionIDs: [String]!
    var imageName: String!
    
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
        if let personDesc = person["personDescription"] as? String {
            self.personDescription = personDesc
        } else {
            return nil
        }
        if let sessIDs = person["sessionIDs"] as? [String] {
            self.sessionIDs = sessIDs
        } else {
            return nil
        }
        if let imageName = person["imageName"] as? String {
            self.imageName = imageName
        } else {
            return nil
        }
        
    }
}
