//
//  EventModel.swift
//  internship-swift-3
//
//  
//

import Foundation

//MARK: - EventDTO

struct EventDTO: Codable {
    let embedded: Embedded
    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

// MARK: - Embedded

struct Embedded: Codable {
    let events: [Event]
}

// MARK: - Event

struct Event: Codable {
    let name: String?
    let id: String
    let images: [ImageURL]
    let dates: Dates
    let classifications: [Classification]
    let seatmap: Seatmap
    let embedded: EventEmbedded
    
    enum CodingKeys: String, CodingKey {
        case name, id,  dates, classifications, seatmap, images
        case embedded = "_embedded"
    }
}

// MARK: - Classification

struct Classification: Codable {
    let genre, subGenre: Genre
}

// MARK: - Genre

struct Genre: Codable {
    let id, name: String
}

// MARK: - Dates

struct Dates: Codable {
    let start: Start
}

// MARK: - Start

struct Start: Codable {
    let localDate, localTime: String?
}

// MARK: - EventEmbedded

struct EventEmbedded: Codable {
    let venues: [Venue]
}

// MARK: - Attraction

struct Attraction: Codable {
    let images: [ImageURL]
}

// MARK: - Image

struct ImageURL: Codable {
    let url: String
}

// MARK: - AttractionLinks

struct AttractionLinks: Codable {
    let linksSelf: First

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - First
struct First: Codable {
    let href: String
}

// MARK: - Venue

struct Venue: Codable {
    let images: [ImageURL]?
    let city: City
    let country: Country
    let address: Address
    let location: Location
    let boxOfficeInfo: BoxOfficeInfo?
}

// MARK: - Address

struct Address: Codable {
    let line1: String
}

// MARK: - BoxOfficeInfo

struct BoxOfficeInfo: Codable {
    let phoneNumberDetail: String
}

// MARK: - City

struct City: Codable {
    let name: String
}

// MARK: - Country

struct Country: Codable {
    let name: String
}

//MARK: - Location

struct Location: Codable {
    let longitude, latitude: String
}

// MARK: - Seatmap

struct Seatmap: Codable {
    let staticUrl: String
}
