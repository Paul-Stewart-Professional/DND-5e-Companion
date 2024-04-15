//
//  ItemCardView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/6/24.
//

import SwiftUI
import DNDSchema

struct ItemCardView: View {
    
    @ObservedObject var sharedItemsArray: SharedItemsArray
    
    var itemTitle: String
    var equipmentCategory: String
    var itemDescription: [String]
    var itemRarity: String
    var item: MagicItemQuery.Data.MagicItem
    @State var isLiked: Bool
    
    var body: some View {
        ZStack{
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(itemTitle)
                        .font(.system(size: 25, weight: .black))
                        .lineLimit(1)
                    Text("Equipment Category: \(equipmentCategory)")
                    Text(itemDescription.joined(separator: " "))
                    .font(.system(size: 15, weight: .light))
                }
                .font(.system(size: 16, weight: .bold))
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 0))
                
                VStack() {
                    Text(itemRarity.replacingOccurrences(of: "_", with: " "))
                        .frame(width: 90, height: 80)
                        .font(.system(size: 22, weight: .black))
                        .multilineTextAlignment(.center)
                        .background(Color.softYellow)
                        .clipShape(.rect(cornerRadius: CGFloat(14)))
                    Button(action: {
                        if sharedItemsArray.savedItemsArray.contains(item) {
                            Task {
                                await sharedItemsArray.dislikeItem(item: item)
                            }
                        } else {
                            Task {
                                await sharedItemsArray.likeItem(item: item)
                            }
                        }
//                        isLiked.toggle()
                    }, label: {
                        Image(systemName: sharedItemsArray.savedItemsArray.contains(item) ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color.darkGreen)
                            .frame(width: 60, height: 60)
                        
                    })
                }
                .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 10))

            }
            
            
            
        }
        .frame(width: 375, height: 200)
        .background(Color.lightBrown)
        .clipShape(.rect(cornerRadius: CGFloat(30)))
    }
}
//
//#Preview {
//    ItemCardView(sharedItemsArray: <#SharedItemsArray#>, itemTitle: <#String#>, spellRange: <#String#>, spellSchool: <#String#>, spellDescription: <#[String]#>, spellLevel: <#Int#>, spell: <#SpellsQuery.Data.Spell#>, isLiked: <#Bool#>)
//}
