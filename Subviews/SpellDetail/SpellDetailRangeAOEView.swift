//
//  SpellDetailRangeAOEView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/28/24.
//

import SwiftUI

struct SpellDetailRangeAOEView: View {
    var range: String
    var AOE: Int?
    var AOEString: String {
        return "AOE: \(String(AOE!))"
    }
    var body: some View {
        HStack {
            Text("Range: \(range)")
                .frame(maxWidth: 400, maxHeight: 50, alignment: .leading)
                .padding(.leading, 8)
                .background(Color.lightBrown)
                .clipShape(.rect(cornerRadius: 14.0))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            Text(AOE != nil ? String(AOEString) : "AOE: N/A")
                .frame(maxWidth: 400, maxHeight: 50, alignment: .leading)
                .padding(.leading, 8)
                .background(Color.lightBrown)
                .clipShape(.rect(cornerRadius: 14.0))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
        .frame(maxWidth: 400, idealHeight: 50, maxHeight: 50, alignment: .leading)
    }
}

#Preview {
    SpellDetailRangeAOEView(range: "90 feet", AOE: 4)
}
