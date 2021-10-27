//
//  EventsView.swift
//  internship-swift-3
//
//
//

import SwiftUI

struct EventsView: View {
    
    @ObservedObject private var viewModel = EventsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.events) { event in
                    EventCellView(model: event)
                }.navigationBarTitle("Events", displayMode: .inline)
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}