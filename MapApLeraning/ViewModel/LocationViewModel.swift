import SwiftUI
import MapKit

class LocationViewModel: ObservableObject {
    
    //All loaded locatoins
    @Published var locations: [Location]
    
    //Current Location on map
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    // Current Region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    //Show list of locations
    @Published var showListLocations: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation (.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    public func toggleLocationList(){
        withAnimation(.easeInOut){
            showListLocations.toggle()
        }
    }
    
    public func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showListLocations = false
        }
    }
}
