//
//  EventsView.swift
//  internship-swift-3
//
//
//

import SwiftUI

struct EventsView: View {
    
    @ObservedObject private var viewModel = EventsViewModel()
    @State private var showFavoritesOnly = false
    
    var filteredEvents: [EventModel] {
        viewModel.events.filter { event in
            (!showFavoritesOnly || event.isFavorite)
        }
    }
    
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
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites Only")
                    }.padding(.horizontal, 10)
                     .padding(.top, 10)
                    List(filteredEvents) { event in
                        NavigationLink(destination: EventDetailView(model: event).environmentObject(viewModel)) {
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
