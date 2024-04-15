//
//  SpellDetailDCTypeView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI

struct SpellDetailDCTypeView: View {
    var body: some View {
        Text("DC Type")
            .frame(maxWidth: 400, maxHeight: 50, alignment: .leading)
            .padding(.leading, 8)
            .background(Color.lightBrown)
            .clipShape(.rect(cornerRadius: 14.0))
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
    }
}

#Preview {
    SpellDetailDCTypeView()
}
