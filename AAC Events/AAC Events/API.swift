//
//  PeopleList.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/11/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import Foundation
typealias JsonDict = Dictionary<String, AnyObject>

let attendeesURL = "https://dl.dropboxusercontent.com/s/5sblpkzw1jztj7e/Attendees.json?dl=0"

class API: NSObject {

    
    func createRequest(baseURL: String) -> URLRequest? {
        
//        var endpoint: String
//        if lastItem != nil && !lastItem!.isEmpty {
//            endpoint = baseURL + "?after=\(lastItem!)&limit=\(itemsPerPage)"
//        } else {
//            endpoint = baseURL + "?limit=\(itemsPerPage)"
//        }
        guard let completeURL = URL(string: baseURL) else {
            print("unable to create URL with: \(baseURL)")
            return nil
        }
        
        var request = URLRequest(url: completeURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"

        return request
    }
    
    func retrieveData(url: String, callback: @escaping ((AnyObject?, Error?) -> ())) {
        
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
}
