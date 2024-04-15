//
//  SpellDetailClassesView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI
import DNDSchema

struct SpellDetailClassesView: View {
    var classes: [SpellDetailQuery.Data.Spell.Class]
    var body: some View {
        HStack(alignment: .center) {
            #warning("classes will not show up nicely if there are multiple. fix asap")
            ForEach(classes, id: \.self) { spellClass in
                Text(spellClass != classes.last ? spellClass.name + "," : spellClass.name)
                    .font(.system(size: 14))
                    .minimumScaleFactor(0.01)
            }
        }
            .frame(maxWidth: 400, idealHeight: 50, maxHeight: 50, alignment: .leading)
            .padding(.leading, 8)
            .background(Color.softYellow)
            .clipShape(.rect(cornerRadius: 14.0))
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8))
        
    }
}
//
//#Preview {
//    SpellDetailClassesView(classes: ["Wizard", "Sorcerer"])
//}
