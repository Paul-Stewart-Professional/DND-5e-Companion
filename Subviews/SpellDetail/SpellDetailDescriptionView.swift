//
//  SpellDetailDescriptionView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI
import DNDSchema

struct SpellDetailDescriptionView: View {
    var spellDescription: [String]
    var body: some View {
        VStack {
            ForEach(spellDescription, id: \.self) { descriptionString in
                    Text(descriptionString)
                        .frame(maxWidth: 400, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                        .padding(EdgeInsets(top: 12, leading: 8, bottom: 8, trailing: 8))
                        .background(Color.lightBrown)
                        .clipShape(RoundedRectangle(cornerRadius: 14.0))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
//
//#Preview {
//    SpellDetailDescriptionView()
//}
