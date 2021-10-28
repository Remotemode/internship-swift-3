//
//  EventsViewModel.swift
//  internship-swift-3
//
//  
//

import Foundation
import Combine

class EventsViewModel: ObservableObject {
    
    @Published var events: [EventModel] = []
    @Published var isLoading = false
    var cancellation: AnyCancellable?
    
    var service = EventsService.shared
    var requester = EventsRequester()

    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
        isLoading = true
        cancellation = requester.fetch()
            .mapError(  {(error) -> Error in
                print(error)
                return error
            })
            .map({ baseModel in
                return self.service.createEventModel(from: baseModel.embedded.events)
            })
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] events  in
            
                self?.events = events
                self?.isLoading = false
                
            })
    }
}
