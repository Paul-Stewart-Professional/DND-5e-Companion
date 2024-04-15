//
//  SpellCardView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/15/24.
//

import SwiftUI
import DNDSchema

struct SpellCardView: View {
    
    @ObservedObject var sharedSpellsArray: SharedSpellsArray
    
    var spellTitle: String
    var spellRange: String
    var spellSchool: String
    var spellDescription: [String]
    var spellLevel: Int
    var spell: SpellsQuery.Data.Spell
    
    var body: some View {
        ZStack{
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(spellTitle)
                        .font(.system(size: 25, weight: .black))
                        .lineLimit(1)
                    Text("Spell Range: \(spellRange)")
                    Text("Spell School: \(spellSchool)")
                    Text(spellDescription.joined(separator: " "))
                    .font(.system(size: 15, weight: .light))
                }
                .font(.system(size: 16, weight: .bold))
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                
                VStack() {
                    Text(String(spellLevel))
                        .frame(width: 90, height: 100)
                        .font(.system(size: 70, weight: .black))
                        .background(Color.softYellow)
                        .clipShape(.rect(cornerRadius: CGFloat(14)))
                    Button(action: {
                        if sharedSpellsArray.savedSpellsArray.contains(spell) {
                            Task {
                                await sharedSpellsArray.dislikeSpell(spell: spell)
                            }
                        } else {
                            Task {
                                await sharedSpellsArray.likeSpell(spell: spell)
                            }
                        }
                    }, label: {
                        Image(systemName: sharedSpellsArray.savedSpellsArray.contains(spell) ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color.darkGreen)
                            .frame(width: 60, height: 60)
                        
                    })
                }
                .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 10))

            }
            
            
            
        }
        .frame(width: 375, height: 200)
        .background(Color.lightBrown)
        .clipShape(.rect(cornerRadius: CGFloat(30)))
    }
}

//#Preview {
//    SpellCardView(sharedSpellsArray: SharedSpellsArray(), spellTitle: "Spell Title", spellRange: "90 Feet", spellSchool: "Necromancy", spellDescription: ["Description"], spellLevel: 9)
//}
