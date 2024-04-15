//
//  ClearFilterButtonView.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/11/24.
//

import SwiftUI

struct ClearFilterButtonView: View {
    var clearFilter: () -> Void
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Menu {
                    Button {
                        clearFilter()
                    } label: {
                        Text("Clear Filter")
                    }
                    
                } label: {
                    Image(systemName: "xmark.app.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(Color.red)
                        .background(Color.white)
                        .clipShape(.circle)
                }
                .padding()
            }
        }
    }
}
