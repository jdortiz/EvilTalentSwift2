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
    
    var completion: ((jsonData: [NSDictionary]) -> Void)?


    func fetchEvilDudes(completion: (jsonData: [NSDictionary]) -> Void) {
        guard let URL = NSURL(string: endPoint) else {
            return
        }
        let task = NSURLSession.sharedSession().dataTaskWithURL(URL, completionHandler: parseServerData)
        task.resume()
    }

    
    func parseServerData(data: NSData?, response: NSURLResponse?, error: NSError?) {
        guard error == nil && data != nil  else {
            print("Failed to download data from the site.", appendNewline: true)
            return
        }
        do {
            if case let dictionaries as [NSDictionary] = try NSJSONSerialization.JSONObjectWithData(data!, options: []) {
                completion?(jsonData: dictionaries)
            }
        } catch {
            print("Unexpected data format provided by server.", appendNewLine: true)
        }
    }
}
