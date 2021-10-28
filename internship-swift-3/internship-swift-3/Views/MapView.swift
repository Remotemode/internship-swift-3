//
//  MapView.swift
//  internship-swift-3
//
//  
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let mapType: MapType
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        Map(mapRect: $viewModel.mapRect,
            showsUserLocation: true,
            annotationItems: viewModel.annotationItems) { place in
            MapAnnotation(coordinate: place.coordinate) {
                PlaceAnnotationView().environmentObject(place)
                    .onTapGesture {
                        viewModel.annotationItems.forEach { place in
                            if place.isSelected {
                                place.isSelected = false
                            }
                        }
                        place.isSelected.toggle()
                    }
            }
        }
            .ignoresSafeArea()
            .onAppear {
                viewModel.fetchEvents(with: mapType)
                viewModel.checkIfLocationServicesIsEnabled()
                viewModel.fit()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapType: .allPlace)
    }
}
