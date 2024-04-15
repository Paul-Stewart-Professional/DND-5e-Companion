//
//  dnd5eCompanionApp.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/5/24.
//

import SwiftUI

@main
struct dnd5eCompanionApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(sharedSpellsArray: SharedSpellsArray(), sharedItemsArray: SharedItemsArray())
        }
    }
}
