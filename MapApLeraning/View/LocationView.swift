import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View{
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
