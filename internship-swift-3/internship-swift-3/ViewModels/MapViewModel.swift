//
//  MapViewModel.swift
//  internship-swift-3
//
// 
//

import MapKit
import Combine

enum MapType {
    
    case single(id: String)
    case allPlace
    
}

final class MapViewModel: NSObject, ObservableObject {
    
    //MARK: - Publishers
    
    @Published var annotationItems: [AnnotatedItem] = []
    @Published var mapRect = MKMapRect()
    
    //MARK: - Private methods
    
    private var cancellation: AnyCancellable?
    private var service = EventsService.shared
    private var requester = EventsRequester()
    private var locationManager: CLLocationManager?
    
    //MARK: - Public methods
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        } else {
            print("Show an alert")
        }
    }
    
    func fetchEvents(with mapType: MapType) {
        cancellation = requester.fetch()
            .mapError(  {(error) -> Error in
                print(error)
                return error
            })
            .map({ baseModel in
                return self.service.createAnnotationModel(from: baseModel.embedded.events)
            })
            .sink(receiveCompletion: {_ in }, receiveValue: { annotationItems  in
                switch mapType {
                case .single(let id):
                    if let place = annotationItems.first(where: { $0.id == id }) {
                        self.annotationItems = [place]
                    }
                case .allPlace:
                    self.annotationItems = annotationItems
                }
                self.fit()
            })
    }
    
    func fit() {
        let points = annotationItems.map(\.coordinate).map(MKMapPoint.init)
        mapRect = points.reduce(MKMapRect.null) { rect, point in
            let newRect = MKMapRect(origin: point, size: MKMapSize())
            return rect.union(newRect)
        }
    }
    
    //MARK: - Private methods
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
}

//MARK: - CLLocationManagerDelegate

extension MapViewModel: CLLocationManagerDelegate {
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
