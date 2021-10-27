//
//  Requester.swift
//  internship-swift-3
//
//  
//

import Foundation

class EventsRequester {
    
    func fetch(_ filename: String) -> EventDTO {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(EventDTO.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(EventDTO.self):\n\(error)")
        }
    }
    
}
