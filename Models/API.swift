//
//  API.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/7/24.
//

import Foundation

struct API {
    
    static let shared = API()
    
    static var url = URL(string: "https://www.dnd5eapi.co/graphql")
}
