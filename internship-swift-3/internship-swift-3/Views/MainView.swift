//
//  ContentView.swift
//  internship-swift-3
//
//  
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "list.dash")
                }
            MapView(mapType: .allPlace)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
        }
        .background(Color.gray)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
