//
//  SavedSpellsItemsView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/1/24.
//

import SwiftUI

struct SavedSpellsItemsView: View {
    
    @EnvironmentObject var sharedSpellsArray: SharedSpellsArray
    @EnvironmentObject var sharedItemsArray: SharedItemsArray
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkBrown.ignoresSafeArea()
                VStack{
                    Text("My Spells/Items")
                        .font(.system(.largeTitle, weight: .black))
                        .foregroundStyle(Color.softYellow)
                    Spacer()
                }
                VStack(spacing: sharedSpellsArray.savedSpellsArray.isEmpty ? 200 : 20) {
                    VStack(alignment: .leading) {
                        Text("My Spells")
                            .font(.system(.largeTitle, weight: .black))
                            .foregroundStyle(Color.softYellow)
                            .padding(.leading, 5)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(sharedSpellsArray.savedSpellsArray.reversed(), id: \.self) { spell in
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
                        }
                    }
                    .padding(3)
                    VStack(alignment: .leading) {
                        Text("My Items")
                            .font(.system(.largeTitle, weight: .black))
                            .foregroundStyle(Color.softYellow)
                            .padding(.leading, 5)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(sharedItemsArray.savedItemsArray.reversed(), id: \.self) { item in
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
                    .padding(3)
                }
                .padding(.top, 24)
            }
        }
        .onChange(of: sharedSpellsArray.savedSpellsArray) { newValue in
            
        }
    }
}
//
//#Preview {
//    SavedSpellsItemsView(sharedSpellsArray: <#SharedSpellsArray#>)
//}
