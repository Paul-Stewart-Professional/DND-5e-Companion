//
//  SearchFilterView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/16/24.
//

import SwiftUI
import ApolloAPI
import DNDSchema

struct SpellsSearchFilterView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isEditing: Bool = false
    @State var level: Double = SpellSearchFilter.shared.maxLevel
    @State var classSelection = SpellSearchFilter.shared.classSelection
    @State var schoolSelection = SpellSearchFilter.shared.schoolSelection
    @Binding var showClearFilterButton: Bool
    
    @StateObject var sharedSpellsArray: SharedSpellsArray
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBrown.ignoresSafeArea()
                VStack(spacing: 60) {
                    VStack(alignment: .leading) {
                        
                        Text("Max Spell Level : \(Int(level))")
                        Slider(
                            value: $level,
                            in: 0...9,
                            onEditingChanged: { editing in
                                isEditing = editing
                            }
                        )
                        .frame(width: 350)
                        .tint(Color.black)
                    }
                    HStack {
                        HStack(spacing: 5) {
                            Text("Class:")
                            Picker("Select a Class", selection: $classSelection) {
                                ForEach(Classes.shared.characterClasses, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        HStack(spacing: 5) {
                            Text("School:")
                            Picker("Select a School", selection: $schoolSelection) {
                                ForEach(MagicSchools.shared.magicSchools, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                }
            }
            .font(.system(size: 18, weight: .regular))
            .foregroundStyle(Color.black)
            .toolbar {
                Button(action: {
                    NetworkController.shared.fetchSpells(name: nil,
                                                         level: .some(level.makeIntArrayFromZeroToNumber()),
                                                         characterClass: classSelection != "any" ? .some(classSelection.lowercased()) : nil,
                                                         school: schoolSelection != "any" ? .some(schoolSelection.lowercased()) : nil,
                                                         range: nil,
                                                         limit: 100) { fetchedSpells in
                        sharedSpellsArray.filteredSpellsArray = fetchedSpells
                    }
                    SpellSearchFilter.shared.maxLevel = level
                    SpellSearchFilter.shared.classSelection = classSelection
                    SpellSearchFilter.shared.schoolSelection = schoolSelection
                    showClearFilterButton = true
                    dismiss()
                }, label: {
                    Text("Save Filter")
                })
                .foregroundStyle(Color.blue)
            }
        }
    }
}

#Preview {
    SpellsSearchFilterView(showClearFilterButton: .constant(false), sharedSpellsArray: SharedSpellsArray())
}
