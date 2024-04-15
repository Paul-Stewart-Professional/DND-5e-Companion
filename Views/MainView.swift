//
//  MainView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/1/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var sharedSpellsArray: SharedSpellsArray
    @StateObject var sharedItemsArray: SharedItemsArray
    
    var body: some View {
        TabView {
            SpellsItemsView(savedSpellsIndexArray: $sharedSpellsArray.savedSpellsIndexArray, savedItemsIndexArray: $sharedItemsArray.savedItemsIndexArray)
                .task {
                    do {
                        try await sharedItemsArray.load()
                        for item in sharedItemsArray.itemsArray {
                            if sharedItemsArray.savedItemsIndexArray.contains(item.index) && !sharedItemsArray.savedItemsArray.contains(item) {
                                sharedItemsArray.savedItemsArray.append(item)
                                print("saved items updated")
                            }
                        }
                        try await sharedSpellsArray.load()
                        for spell in sharedSpellsArray.spellsArray {
                            if sharedSpellsArray.savedSpellsIndexArray.contains(spell.index) && !sharedSpellsArray.savedSpellsArray.contains(spell) {
                                sharedSpellsArray.savedSpellsArray.append(spell)
                                print("saved spells updated")
                            }
                        }
                        print("Saved Index Loaded")
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                        .frame(width: 100, height: 100)
                }
                .toolbarBackground(
                    Color.darkBrown,
                    for: .tabBar
                )
            SavedSpellsItemsView()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .frame(width: 100, height: 100)
                }
                .toolbarBackground(
                    Color.darkBrown,
                    for: .tabBar
                )
        }
        .background(Color.darkBrown)
        .environmentObject(sharedSpellsArray)
        .environmentObject(sharedItemsArray)
    }
}

#Preview {
    MainView(sharedSpellsArray: SharedSpellsArray(), sharedItemsArray: SharedItemsArray())
}
