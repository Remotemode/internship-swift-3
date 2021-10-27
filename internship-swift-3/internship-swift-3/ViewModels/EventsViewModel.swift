//
//  EventsViewModel.swift
//  internship-swift-3
//
//  
//

import Foundation

class EventsViewModel: ObservableObject {
    
    @Published var events: [EventModel] = []
    
    var service = EventsService.shared
    var requester = EventsRequester()

    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
       let eventDTO = requester.fetch("Event.json")
        events = service.createEventModel(from: eventDTO.embedded.events)
    }
}
