//
//  SpellDetailTitleView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI
import DNDSchema

struct SpellDetailTitleView: View {
    
    @EnvironmentObject var sharedSpellsArray: SharedSpellsArray
    
    var spellTitle: String
    var spell: SpellDetailQuery.Data.Spell
    var body: some View {
        HStack {
            Text("\(spellTitle)")
                .font(.system(.largeTitle, weight: .black))
                .minimumScaleFactor(0.01)
                .padding()
            Spacer()
            
            Button {
                if sharedSpellsArray.savedSpellsArray.contains(where: { $0.name == spell.name }) {
                    Task {
                        await sharedSpellsArray.dislikeSpell(spell: sharedSpellsArray.savedSpellsArray.first(where: { $0.name == spellTitle })!)
                    }
                    
                } else {
                    Task {
                        await sharedSpellsArray.likeSpell(spell: sharedSpellsArray.spellsArray.first(where: { $0.name == spellTitle })!)
                    }
                }
            } label: {
                Image(systemName: sharedSpellsArray.savedSpellsArray.contains(where: { $0.name == spell.name }) ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.darkGreen)
                    .frame(width: 50, height: 50)
                    .padding()
            }
        }
        .frame(maxWidth: 400, maxHeight: 75)
        .background(Color.softYellow)
        .clipShape(.rect(cornerRadius: 14.0))
        .padding(8)
    }
}
//
//#Preview {
//    SpellDetailTitleView(spellTitle: "Title of Spell", isLiked: true)
//}
