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
    @State private var searchText = ""
    
    var filteredEvents: [EventModel] {
        viewModel.events.filter { event in
            (!showFavoritesOnly || event.isFavorite)
        }
    }
    
    var searchListEvents: [EventModel] {
        filteredEvents.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })
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
                    SearchBar(text: $searchText)
                    .padding(.top, 10)
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites Only")
                    }.padding(.horizontal, 10)
                    List(searchListEvents) { event in
                        NavigationLink(destination: EventDetailView(model: event).environmentObject(viewModel)) {
                            EventCellView(model: event)
                        }
                    }.navigationBarTitle("Events", displayMode: .inline).overlay(Group {
                        if searchListEvents.isEmpty {
                            Text("There is no events.")
                        }
                    })
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
