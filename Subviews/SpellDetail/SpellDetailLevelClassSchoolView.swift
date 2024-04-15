//
//  SpellDetailLevelClassSchoolView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI
import DNDSchema

struct SpellDetailLevelClassSchoolView: View {
    var level: Int
    var dc: SpellDetailQuery.Data.Spell.Dc?
    var school: SpellDetailQuery.Data.Spell.School
    var body: some View {
        HStack(spacing: 20) {
            Text("\(level)")
                .font(.system(size: 80, weight: .black))
                .frame(width: 110, height: 110)
                .background(Color.lightBrown)
                .clipShape(.rect(cornerRadius: 14.0))
            Text(
                dc != nil ? dc!.type.name : "N/A"
            )
            .font(.system(size: 60, weight: .black))
            .minimumScaleFactor(0.01)
            .padding(3)
            .frame(width: 110, height: 110)
            .background(Color.lightBrown)
            .clipShape(.rect(cornerRadius: 14.0))
            HStack {
                Image(school.name.lowercased())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(3)
                    .frame(width: 110, height: 110)
                    .background(Color.lightBrown)
                    .clipShape(.rect(cornerRadius: 14.0))
            }
        }
    }
}
//
//#Preview {
//    SpellDetailLevelClassSchoolView(level: 7, range: .NONE, school: )
//}
