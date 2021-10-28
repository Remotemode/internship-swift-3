//
//  PlaceAnnotationView.swift
//  internship-swift-3
//
//  
//

import SwiftUI

struct PlaceAnnotationView: View {
    @EnvironmentObject private var place: AnnotatedItem
    
    var body: some View {
        VStack(spacing: 0) {
            Text(place.name)
                .font(.callout)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)
                .opacity(place.isSelected ? 1 : 0)
            
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
    }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAnnotationView()
    }
}
