//
//  ItemSearchFilterView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/20/24.
//

import SwiftUI

struct ItemSearchFilterView: View {
    @Environment(\.dismiss) var dismiss
    @State var filterBySelection = ItemSearchFilter.shared.filterBy
    @State var direction = ItemSearchFilter.shared.direction
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightBrown.ignoresSafeArea()
                
                Text("Filter coming in v2")
            }
            //MARK: this is where you need to make the network call with the filter set up for the items
        }
    }
}

#Preview {
    ItemSearchFilterView()
}
