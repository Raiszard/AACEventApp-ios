//
//  Sponsors.swift
//  AAC Events
//
//  Created by Siar Noorzay on 2/24/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit

class AllSponsors: NSObject {
    
    var allLevelSponsors: [SponsorLevel]
    
    init?(dict: JsonDict) {
        var mutableSponsors: [SponsorLevel] = []
        
        if let jsonArray = dict["sponsorLevels"] as? [JsonDict] {
            
            for levelDict in jsonArray {
                if let level = SponsorLevel(dict: levelDict) {
                    mutableSponsors.append(level)
                }
            }
            self.allLevelSponsors = mutableSponsors
            
        } else { return nil }
    }
}

class SponsorLevel: NSObject {
    
    var level: String
    var sponsors: [Sponsor]
    
    init?(dict: JsonDict) {
        
        if let lev = dict["level"] as? String {
            self.level = lev
        } else { return nil }
        
        var mutableSponsors: [Sponsor] = []
        
        if let sponsorsArray = dict["sponsorArray"] as? [JsonDict] {
            for sponsorDict in sponsorsArray {
                if let sponsor = Sponsor(dict: sponsorDict) {
                    mutableSponsors.append(sponsor)
                }
            }
            self.sponsors = mutableSponsors
        } else { return nil }
    }

}

class Sponsor: NSObject {
    
    var name: String
    var headerImageURL: String
    var logoImageURL: String
    var imageName: String

    var sponsorDescription: String
    
    init?(dict: JsonDict) {
        if let imgURL = dict["logoImageURL"] as? String {
            self.logoImageURL = imgURL
        } else { return nil }
        
        if let imgURL2 = dict["headerImageURL"] as? String {
            self.headerImageURL = imgURL2
        } else { return nil }

        if let nom = dict["name"] as? String {
            self.name = nom
        } else { return nil }
        
        if let desc = dict["description"] as? String {
            self.sponsorDescription = desc
        } else { return nil }
        
        if let imgName = dict["imageName"] as? String {
            self.imageName = imgName
        } else { return nil }

    }
}

/*
 
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
 */

