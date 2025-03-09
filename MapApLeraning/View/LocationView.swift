import SwiftUI

struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View{
        List{
            ForEach(vm.locations){i in
                Text("\(i.name)")
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}
