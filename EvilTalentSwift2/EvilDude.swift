//
//  EvilDude.swift
//  EvilTalentSwift2
//
//  Created by Jorge D. Ortiz Fuentes on 18/8/15.
//  Copyright © 2015 powwau. All rights reserved.
//


import Foundation


class EvilDude {
    // MARK: - Constants & Parameters
    
    static let dictionaryKeyName = "name"
    static let dictionaryKeyDestructivePower = "destruction"
    static let dictionaryKeyMotivation = "motivation"
    
    static let minDestructivePower = 0
    static let maxDestructivePower = 4
    static let minMotivation = 0
    static let maxMotivation = 4
    
    
    // MARK: - Properties
    
    var name: String = ""
    var destructivePower: Int = 2
    var motivation: Int = 2
    var rating: Int {
        get {
            return (destructivePower + motivation) / 2
        }
    }
    
    
    // MARK: - Initialization
    
    init?(dictionary: NSDictionary) {
        guard let name = dictionary[EvilDude.dictionaryKeyName] as? String
            where name.characters.count > 0 else {
                return nil
        }
        
        guard let destructivePower = dictionary[EvilDude.dictionaryKeyDestructivePower] as? Int
            where destructivePower >= EvilDude.minDestructivePower
                && destructivePower <= EvilDude.maxDestructivePower else {
                    return nil
        }
        
        guard let motivation = dictionary[EvilDude.dictionaryKeyMotivation] as? Int
            where motivation >= EvilDude.minMotivation
                && motivation <= EvilDude.maxMotivation else {
                    return nil
        }
        
        
        self.name = name
        self.destructivePower = destructivePower
        self.motivation = motivation
    }
}
