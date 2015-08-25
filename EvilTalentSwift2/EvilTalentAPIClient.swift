//
//  EvilTalentAPIClient.swift
//  EvilTalentSwift2
//
//  Created by Jorge D. Ortiz Fuentes on 18/8/15.
//  Copyright © 2015 powwau. All rights reserved.
//


import Foundation


class EvilTalentAPIClient {
    let endPoint = "https://api.eviltalent.nowhere/v1/evildudes"

    
    // MARK: - Properties
    
    lazy var sharedSession = NSURLSession.sharedSession()
    var completion: ((jsonData: [NSDictionary]) -> Void)?


    func fetchEvilDudes(completion: (jsonData: [NSDictionary]) -> Void) {
        guard let URL = NSURL(string: endPoint) else {
            return
        }
        let task = sharedSession.dataTaskWithURL(URL, completionHandler: parseServerData)
        task.resume()
    }

    
    func parseServerData(data: NSData?, response: NSURLResponse?, error: NSError?) {
        guard error == nil else {
            print("ERROR: Unable to connect to server: \(error!.localizedDescription)")
            return
        }
        
        guard let data = data else {
            // Obtain information from response
            print("Failed to download data from server.")
            return
        }
        
        do {
            let dictionaries = try parseJSONData(data, options: []) as! [NSDictionary]
            completion?(jsonData: dictionaries)
        } catch {
            print("Unexpected data format provided by server.")
        }
    }
    
    
    func parseJSONData(data: NSData, options opt: NSJSONReadingOptions) throws -> AnyObject {
        return try NSJSONSerialization.JSONObjectWithData(data, options: opt)
    }
}
