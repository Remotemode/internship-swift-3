//
//  EventsService.swift
//  internship-swift-3
//
//
//

import Foundation
import Combine
import MapKit

class EventsService {
    
    //MARK: - Static
    
    static let shared = EventsService()
    
    //MARK: - Init
    
    private init(){}
    
    //MARK: - Private methods
    
    private let requester = EventsRequester()
    
    //MARK: - Public methods
    
    func createEventModel(from events: [Event]) -> [EventModel] {
        return events.map { event -> EventModel? in
            guard let name = event.name,
                  let  localdate = event.dates.start.localDate,
                  let localTime = event.dates.start.localTime
            else { return nil }
            
            let date = localdate + " " + localTime
            let genre = event.classifications.isEmpty ? "---" : event.classifications[0].genre.name
            let subGenre = event.classifications.isEmpty ? "---" : event.classifications[0].subGenre.name
            let seatmapImageUrl  = event.seatmap.staticUrl
            let fullAdress = event.embedded.venues.isEmpty ? "---" : concatAdress(venue: event.embedded.venues[0])
            let location = event.embedded.venues.isEmpty ? Location(longitude: "", latitude: "") : event.embedded.venues[0].location
            let imageUrl = event.images[0].url
            let phoneNumber = event.embedded.venues[0].boxOfficeInfo?.phoneNumberDetail
            return EventModel(id: event.id,
                              name: name,
                              date: date,
                              genre: genre,
                              subGenre: subGenre,
                              seatMapImageUrl: seatmapImageUrl,
                              fullAdress: fullAdress,
                              location: location ,
                              imageUrl: imageUrl,
                              phoneNumber: phoneNumber ?? "---")
        }.compactMap({ $0 })
    }
    
    func createAnnotationModel(from events: [Event]) -> [AnnotatedItem] {
        return events.map { event -> AnnotatedItem? in
            guard let name = event.name,
                  let latitude = event.embedded.venues.first?.location.latitude,
                  let longitude = event.embedded.venues.first?.location.longitude,
                  let latitudeDouble = Double(latitude),
                  let longitudeDouble = Double(longitude) else { return nil }
            
            return AnnotatedItem(id: event.id,
                                 name: name,
                                 coordinate: CLLocationCoordinate2D(latitude: latitudeDouble,
                                                                    longitude: longitudeDouble))
        }.compactMap({ $0 })
        
    }
    
    //MARK: - Private methods
    
    private func concatAdress(venue:Venue) -> String {
        return "\(venue.country.name)/ \(venue.city.name)/\(venue.address.line1)"
    }
}
