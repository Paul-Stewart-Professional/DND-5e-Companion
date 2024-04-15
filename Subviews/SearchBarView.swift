//
//  SearchBarView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/18/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var sharedSpellsArray: SharedSpellsArray
    @ObservedObject var sharedItemsArray: SharedItemsArray
    
    @Binding var searchText: String
    @Binding var showCancelButton: Bool
    @Binding var showingSheet: Bool
    @Binding var selectedSheetValue: Int
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("filter", text: $searchText, onEditingChanged: { isEditing in
                    withAnimation(.easeIn) {
                        self.showCancelButton = true
                    }
                }, onCommit: {
                    //nothing for now
                })
                .onChange(of: searchText, perform: { _ in
                    sharedSpellsArray.filterSpells(with: searchText.lowercased())
                    sharedItemsArray.filterItems(with: searchText.lowercased())
                })
                .foregroundColor(.primary)
                Button(action: {
                    showCancelButton ? $searchText.wrappedValue = "" : $showingSheet.wrappedValue.toggle()
                    if showCancelButton {
                        sharedSpellsArray.filteredSpellsArray = []
                        sharedItemsArray.filteredItemsArray = []
                    }
                }) {
                    if showCancelButton && $searchText.wrappedValue != "" {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(1)
                    } else if showCancelButton && $searchText.wrappedValue == ""{
                        Image(systemName: "xmark.circle.fill")
                            .opacity(0)
                    } else {
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .frame(width: 33, height: 25)
                            .foregroundStyle(Color.black)
                            .opacity(0.7)
                    }
                }
                .padding(.trailing, 4)
                .sheet(isPresented: $showingSheet, content: {
                    ZStack {
                        if selectedSheetValue == 0 {
                            SpellsSearchFilterView(sharedSpellsArray: sharedSpellsArray)
                        } else {
                            ItemSearchFilterView()
                        }
                        
                    }
                    .presentationDetents([.fraction(0.4)])
                })
            }
            .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
            .foregroundStyle(.secondary)
            .background(Color(.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 20))
            if self.$showCancelButton.wrappedValue {
                Button("Cancel") {
                    UIApplication.shared.endEditing(true)
                    self.$searchText.wrappedValue = ""
                    withAnimation {
                        self.$showCancelButton.wrappedValue = false
                    }
                    sharedSpellsArray.filteredSpellsArray = []
                    sharedItemsArray.filteredItemsArray = []
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .foregroundStyle(Color.white)
            }
        }
        .padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
        .font(.system(size: 19, weight: .regular))
    }
}
//
//#Preview {
//    SearchBarView(sharedSpellsArray: SharedSpellsArray(), sharedItemsArray: SharedItemsArray(), searchText: .constant("search"), showCancelButton: .false, showingSheet: .constant(false), selectedSheetValue: .constant(1))
//}
