//
//  SpellDetailHigherLevelView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI

struct SpellDetailHigherLevelView: View {
    var higherLevelDescription: [String]
    var body: some View {
        VStack {
            Text("Upcasting this spell: " + higherLevelDescription.joined(separator: "\n"))
                .frame(maxWidth: 400, maxHeight: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 12, leading: 8, bottom: 8, trailing: 8))
                .background(Color.softYellow)
                .clipShape(.rect(cornerRadius: 14.0))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
//
//#Preview {
//    SpellDetailHigherLevelView(higherLevelDescription: "Higher Level Spell Casting")
//}
