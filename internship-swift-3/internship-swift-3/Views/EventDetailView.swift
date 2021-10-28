//
//  EventDetailView.swift
//  internship-swift-3
//
//  
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    
    @State var model: EventModel
    
    var body: some View {
        ScrollView{
            MapView(mapType: .single(id: model.id))
                .frame( height: 300, alignment: .top)
                .background(Color.green.edgesIgnoringSafeArea(.all))
            AsyncImage(url: URL(string: model.imageUrl)! , placeholder: { Text("No Image") }).frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .offset(y: -110)
                .padding(.bottom, -110)
            VStack (alignment: .center, spacing: 20 ) {
                Text(model.name)
                    .font(.title)
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                Text(model.genre + " / " + model.subGenre)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Divider()
                
                VStack (alignment: .center, spacing: 20 ) {
                    HStack(alignment:.top) {
                        Text("Adress: ")
                        
                        Spacer()
                        Text(model.fullAdress)
                    }
                    
                    HStack {
                        Text("Date: ")
                        Spacer()
                        Text(model.date )
                            .font(.body)
                    }
                    
                    HStack(alignment: .top) {
                        Text("Phone: ").frame(alignment: .top)
                        Spacer()
                        Text(model.phoneNumber )
                            .font(.body)
                    }
                    AsyncImage(url: URL(string: model.seatMapImageUrl)! , placeholder: { Text("No Image") })
                        .frame(height: 200, alignment: .center)
                }
                Spacer()
            }.padding()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = EventModel(id: "223",
                               name: "AWeJWKJAELSdsd vs AKSjdKSJDsadasd",
                               date: "12:21:12 13:03",
                               genre: "Basketball",
                               subGenre: "NBA",
                               seatMapImageUrl: "https://maps.ticketmaster.com/maps/geometry/3/event/2D005B0298293019/staticImage?type=png&systemId=HOST",
                               fullAdress: "USA / Idaho / Gladkova street 21",
                               location: Location(longitude: "", latitude: ""),
                               imageUrl: "https://s1.ticketm.net/dam/a/236/d381735d-e40d-44c2-9055-91cc0038e236_1340151_CUSTOM.jpg",
                               phoneNumber: "704-688-8600 For general group sales questions for Spectrum Center: 704.688.9047"
        )
        EventDetailView(model: model)
    }
}
