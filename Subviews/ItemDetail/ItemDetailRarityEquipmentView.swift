//
//  ItemDetailRarityEquipmentView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/6/24.
//

import SwiftUI

struct ItemDetailRarityEquipmentView: View {
    var rarity: String
    var equipment: String
    var body: some View {
        HStack {
            Text(rarity.replacingOccurrences(of: "_", with: " "))
                .frame(maxWidth: 150, maxHeight: 50, alignment: .center)
                .font(.system(.headline, weight: .black))
                .padding(.leading, 8)
                .background(Color.lightBrown)
                .clipShape(.rect(cornerRadius: 14.0))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            Text(equipment)
                .frame(maxWidth: 400, maxHeight: 50, alignment: .center)
                .font(.system(.headline, weight: .black))
                .padding(.leading, 8)
                .background(Color.lightBrown)
                .clipShape(.rect(cornerRadius: 14.0))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
        .frame(maxWidth: 400, idealHeight: 50, maxHeight: 50, alignment: .center)

    }
}

#Preview {
    ItemDetailRarityEquipmentView(rarity: "Common", equipment: "Ammunition")
}
