//
//  AnnotatedItem.swift
//  internship-swift-3
//
// 
//

import Foundation
import MapKit

class AnnotatedItem: Identifiable, ObservableObject {
    
    let id: String
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    @Published var isSelected: Bool
    
    //MARK: - Init
    
    init(id: String, name: String, coordinate: CLLocationCoordinate2D, isSelected: Bool = false) {
        self.id = id
        self.name = name
        self.coordinate = coordinate
        self.isSelected = isSelected
    }
    
}
