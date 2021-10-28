//
//  Requester.swift
//  internship-swift-3
//
//  
//

import Foundation
import Alamofire
import Combine

class EventsRequester {
    
    let url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey="
    let apiKey = "sh703rNnW8rstP9VGH6E5Kc1afGL1pse"
    
    func fetch() -> AnyPublisher<EventDTO, AFError> {
        let publisher = AF.request(url + apiKey).publishDecodable(type: EventDTO.self)
        return publisher.value()
    }
    
}
