//
//  UserImageButton.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/16/24.
//

import SwiftUI

struct UserImageButton: View {
    var body: some View {
        Menu {
            Button(action: {
                
            }, label: {
                Text("Char One")
            })
            Button(action: {
                
            }, label: {
                Text("Char Two")
            })
        } label: {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    UserImageButton()
}
