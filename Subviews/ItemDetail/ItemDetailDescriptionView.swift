//
//  ItemDetailDescriptionView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/6/24.
//

import SwiftUI

struct ItemDetailDescriptionView: View {
    var itemDescription: [String]
    var body: some View {
        VStack {
            //item description contains the rarity and equipment class in the first item of the array
            ForEach(itemDescription, id: \.self) { descriptionString in
                    Text(descriptionString)
                        .frame(maxWidth: 400, minHeight: 0, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                        .padding(EdgeInsets(top: 12, leading: 8, bottom: 8, trailing: 8))
                        .background(Color.softYellow)
                        .clipShape(RoundedRectangle(cornerRadius: 14.0))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

//#Preview {
//    ItemDetailDescriptionView(itemDescription: <#[String]#>)
//}
