//
//  SearchFilterObject.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/1/24.
//

import Foundation

struct SpellSearchFilter {
    static var shared = SpellSearchFilter()
    var maxLevel: Double = 4.0
    var classSelection: String = "any"
    var schoolSelection: String = "any"
}

struct ItemSearchFilter {
    static var shared = ItemSearchFilter()
    var filterBy: String = "NAME"
    var direction: String = "ASCENDING"
}
