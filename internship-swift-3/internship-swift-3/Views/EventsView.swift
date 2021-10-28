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
        if viewModel.events.isEmpty {
            ActivityIndicator()
                .frame(width: UIScreen.main.bounds.width,
                       height: 50,
                       alignment: .center)
                .navigationBarTitleDisplayMode(.inline)
        } else {
            NavigationView {
                VStack {
                    List(viewModel.events) { event in
                        NavigationLink(destination: EventDetailView(model: event)) {
                            EventCellView(model: event)
                        }
                    }.navigationBarTitle("Events", displayMode: .inline)
                }
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
