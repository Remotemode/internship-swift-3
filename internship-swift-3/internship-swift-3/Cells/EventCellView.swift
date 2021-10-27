//
//  EventCellView.swift
//  internship-swift-3
//
//  
//

import SwiftUI

struct EventCellView: View {
    var model: EventModel
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            HStack {
                Spacer()
                if model.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else {
                    EmptyView()
                }
            }
            HStack{
                AsyncImage(url: URL(string: model.imageUrl)! , placeholder: { Text("Loading") }).frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    .shadow(radius: 7)
            }
            Text(model.name)
                .multilineTextAlignment(.center)
                .font(Font.headline.weight(.semibold))
            HStack(spacing: 0.0){
                Text("\(model.genre) / \(model.subGenre)")
                Spacer()
                Text(model.date)
            }
        }
    }
}

struct EventCellView_Previews: PreviewProvider {
    static var previews: some View {
        let model = EventModel(id: "2323", name: "Event vs Event", date: "21:12:01", genre: "NBA", subGenre: "Bascketball", seatMapImageUrl: "", fullAdress: "San Francisco street", location: Location(longitude: "", latitude: ""), imageUrl: "https://s1.ticketm.net/dam/a/c62/0636ff21-e369-4b8c-bee4-214ea0a81c62_1339761_CUSTOM.jpg", phoneNumber: "123123123123", isFavorite: true)
        EventCellView(model: model).previewLayout(.sizeThatFits)
    }
}
