//
//  EventModel.swift
//  internship-swift-3
//
//  
//

import Foundation

struct EventModel: Identifiable {
    let id: String
    let name:String
    let date: String
    let genre: String
    let subGenre: String
    let seatMapImageUrl: String
    let fullAdress: String
    let location: Location
    let imageUrl: String
    let phoneNumber: String
    var isFavorite: Bool = false
}
