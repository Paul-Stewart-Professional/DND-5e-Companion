//
//  ItemDetailTitleView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/6/24.
//

import SwiftUI
import DNDSchema

struct ItemDetailTitleView: View {
    
    @EnvironmentObject var sharedItemsArray: SharedItemsArray
    
    var itemTitle: String
    var item: MagicItemQuery.Data.MagicItem
    
    var body: some View {
        HStack {
            Text("\(itemTitle)")
                .font(.system(.largeTitle, weight: .black))
                .minimumScaleFactor(0.01)
                .padding()
            Spacer()
            
            Button {
                if sharedItemsArray.savedItemsArray.contains(where: { $0.name == item.name }) {
                    Task {
                        await sharedItemsArray.dislikeItem(item: sharedItemsArray.savedItemsArray.first(where: { $0.name == itemTitle })!)
                    }
                } else {
                    Task {
                        await sharedItemsArray.likeItem(item: sharedItemsArray.itemsArray.first(where: { $0.name == itemTitle })!)
                    }
                }
            } label: {
                Image(systemName: sharedItemsArray.savedItemsArray.contains(where: { $0.name == item.name }) ? "heart.fill" : "heart")
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
//    ItemDetailTitleView()
//}
