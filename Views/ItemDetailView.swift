//
//  ItemDetailView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/6/24.
//

import SwiftUI
import DNDSchema

struct ItemDetailView: View {
    var itemTitle: String
    var equipmentCategory: MagicItemQuery.Data.MagicItem.Equipment_category
    var itemDescription: [String]
    var itemRarity: String
    var item: MagicItemQuery.Data.MagicItem
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkBrown
                VStack {
                    ItemDetailTitleView(itemTitle: item.name, item: item)
                    ScrollView {
                        ItemDetailRarityEquipmentView(rarity: item.rarity.rawValue, equipment: item.equipment_category.name)
                        ItemDetailDescriptionView(itemDescription: item.desc)
                    }
                }
                
            }
            .background(Color.darkBrown)
        }
    }
}

//#Preview {
//    ItemDetailView(itemTitle: <#String#>, equipmentCategory: <#String#>, itemDescription: <#[String]#>, itemRarity: <#String#>, item: <#MagicItemQuery.Data.MagicItem#>)
//}
