//
//  SpellsItemsView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/15/24.
//

import SwiftUI
import DNDSchema


struct SpellsItemsView: View {
    
    @EnvironmentObject var sharedSpellsArray: SharedSpellsArray
    @EnvironmentObject var sharedItemsArray: SharedItemsArray
    
    @Binding var savedSpellsIndexArray: [String]
    @Binding var savedItemsIndexArray: [String]
    
    @State var searchText = ""
    @State var spellItemSelection = 0
    @State var showCancelButton = false
    @State var showClearFilterButton = false
    @State private var showingSheet = false
    @State var level: Int = 9
    @State var classSelection: GraphQLNullable<String> = nil
    @State var schoolSelection: GraphQLNullable<String> = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                    VStack(spacing: 0) {
                        SearchBarView(sharedSpellsArray: sharedSpellsArray,
                                      sharedItemsArray: sharedItemsArray,
                                      searchText: $searchText,
                                      showCancelButton: $showCancelButton, 
                                      showClearFilterButton: $showClearFilterButton,
                                      showingSheet: $showingSheet,
                                      selectedSheetValue: $spellItemSelection)
                        
                        CustomSegmentedControl(items: ["Spells", "Items"],
                                               selectedSegmentIndex: $spellItemSelection)
                        .frame(height: 45)
                        .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
                    }
                    
                    ScrollView {
                        LazyVStack {
                            if spellItemSelection == 0 {
                                if sharedSpellsArray.filteredSpellsArray.isEmpty && searchText != "" {
                                    Text("No spells match the current search criteria.")
                                } else {
                                    ForEach(!sharedSpellsArray.filteredSpellsArray.isEmpty ? sharedSpellsArray.filteredSpellsArray : sharedSpellsArray.spellsArray, id: \.self) { spell in
                                        NavigationLink(destination: SpellsDetailView(spellIndex: .some(spell.index))) {
                                            SpellCardView(sharedSpellsArray: sharedSpellsArray, spellTitle: spell.name,
                                                          spellRange: spell.range,
                                                          spellSchool: spell.school.name,
                                                          spellDescription: spell.desc,
                                                          spellLevel: spell.level,
                                                          spell: spell)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            } else {
                                if sharedItemsArray.filteredItemsArray.isEmpty && searchText != "" {
                                    Text("No items match the current search criteria.")
                                } else {
                                    ForEach(!sharedItemsArray.filteredItemsArray.isEmpty ? sharedItemsArray.filteredItemsArray : sharedItemsArray.itemsArray, id: \.self) { item in
                                        NavigationLink(destination: ItemDetailView(itemTitle: item.name, equipmentCategory: item.equipment_category, itemDescription: item.desc, itemRarity: item.rarity.rawValue, item: item)) {
                                            
                                            ItemCardView(sharedItemsArray: sharedItemsArray,
                                                         itemTitle: item.name,
                                                         equipmentCategory: item.equipment_category.name,
                                                         itemDescription: item.desc,
                                                         itemRarity: item.rarity.rawValue,
                                                         item: item,
                                                         isLiked: sharedItemsArray.savedItemsArray.contains(item))
                                            
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                
                            }
                        }
                    }
                }
                
                VStack(alignment: .center, spacing: 20) {
                    if sharedSpellsArray.spellsArray == [] {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .tint(Color.darkGreen)
                    }
                }
                
                if sharedSpellsArray.filteredSpellsArray != [] || sharedItemsArray.filteredItemsArray != [] {
                    if showClearFilterButton == true {
                        ClearFilterButtonView(clearFilter: clearFilter)
                    }
                }
            }
            .background(Color.darkBrown)
            .onAppear {
                guard sharedSpellsArray.spellsArray.isEmpty || sharedItemsArray.itemsArray.isEmpty else { return }
                fetchSpells()
                fetchItems()
            }
        }
    }
    
    func clearFilter() {
        sharedSpellsArray.filteredSpellsArray = []
        sharedItemsArray.filteredItemsArray = []
        $searchText.wrappedValue = ""
        $showCancelButton.wrappedValue = false
    }
    func fetchItems() {
        NetworkController.shared.fetchMagicItem(equipmentCategory: nil,
                                                order: nil,
                                                name: nil) { fetchedItems in
            sharedItemsArray.itemsArray = fetchedItems
        }
    }
    
    func fetchSpells() {
        NetworkController.shared.fetchSpells(name: nil,
                                             level: nil,
                                             characterClass: nil,
                                             school: nil,
                                             range: nil,
                                             limit: 500) { fetchedSpells in
            sharedSpellsArray.spellsArray = fetchedSpells
        }
    }
}

//
//#Preview {
//    SpellsItemsView(sharedSpellsArray: SharedSpellsArray())
//}
