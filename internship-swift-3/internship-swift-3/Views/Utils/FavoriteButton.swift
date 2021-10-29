//
//  FavoriteButton.swift
//  internship-swift-3
//
//  
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }.rotation3DEffect(.degrees(isSet ? 180 : 0), axis: (x: 0, y: 1, z: 0))
         .animation(.interpolatingSpring(stiffness: 20, damping: 1))
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
