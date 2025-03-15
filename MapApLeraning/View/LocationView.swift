import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View{
        ZStack{
            mapLayer
                .ignoresSafeArea()
            VStack(spacing: 0){
                header
                    .padding()
                Spacer()
                locationPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

extension LocationView{
    private var header: some View{
        VStack {
            Button{
                vm.toggleLocationList()
            }label:{
                Text("\(vm.mapLocation.name + ", " + vm.mapLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
//this animation with numericText i like more than animation which show me Nick Sarno
                    .contentTransition(.numericText())
                //this is nickSarno Method
//                    .animation(.easeInOut, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .rotationEffect(Angle(degrees: vm.showListLocations ? -180 : 0))
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                    }
            }
            
                
            if vm.showListLocations{
                LocationsListView()
            }
            
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View{
        Map(
            coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
//                    MapMarker(coordinate: location.coordinates, tint: .blue)
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
    }
    
    private var locationPreviewStack: some View{
        ZStack{
            ForEach(vm.locations){location in
                if vm.mapLocation.name == location.name{
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
