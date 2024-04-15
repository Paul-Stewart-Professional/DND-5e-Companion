//
//  SpellsDetailView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI
import DNDSchema

struct SpellsDetailView: View {
    
    @EnvironmentObject var sharedSpellsArray: SharedSpellsArray
    
    @State var spell: SpellDetailQuery.Data.Spell?
    var spellIndex: GraphQLNullable<String>
    
    var body: some View {
        
        NavigationStack {
            if let spell {
                ZStack {
                    Color.darkBrown
                    
                    VStack {
                        SpellDetailTitleView(spellTitle: spell.name, spell: spell)
                        ScrollView {
                            SpellDetailLevelClassSchoolView(level: spell.level, dc: spell.dc, school: spell.school)
                            SpellDetailClassesView(classes: spell.classes)
                            SpellDetailDescriptionView(spellDescription: spell.desc)
                            if spell.higher_level != nil {
                                SpellDetailHigherLevelView(higherLevelDescription: spell.higher_level!)
                            }
                            SpellDetailRangeAOEView(range: spell.range, AOE: spell.area_of_effect?.size)
                            Spacer()
                        }
                    }
                    .padding(8)
                    
                }
                .background(Color.darkBrown)
            } else {
                ZStack {
                    Color.darkBrown.ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(Color.darkGreen)
                }
            }
        }
        .onAppear {
            NetworkController.shared.fetchSpellDetail(index: spellIndex) { fetchedSpell in
                self.spell = fetchedSpell
            }
        }
    }
}

//
//#Preview {
//    SpellsDetailView(spell: spell)
//}
