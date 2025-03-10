import SwiftUI

struct LocationsListView: View{
    @EnvironmentObject var vm: LocationViewModel
    var body: some View{
        List{
            ForEach(vm.locations){location in
                Button{
                    vm.showNextLocation(location: location)
                }label:{
                    listRoeViewStyle(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                    
            }
        }
        .listStyle(PlainListStyle())
    }
}

extension LocationsListView{
    private func listRoeViewStyle(location: Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationViewModel())
}
