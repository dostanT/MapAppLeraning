import SwiftUI


struct LocationPreviewView: View {
    // this is a card which will be shown on bottom side of the screen
    @EnvironmentObject private var vm: LocationViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16){
                imageSection
                titleSection
            }
            Spacer()
            VStack(spacing: 8){
                learnMoreButton
                nextButton
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.ultraThinMaterial)
                .offset(y: 70)
        )
        .cornerRadius(10)
    }
}

extension LocationPreviewView{
    
    private var imageSection: some View{
        ZStack{
            if let imageNames = location.imageNames.first{
                Image(imageNames)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)

    }
    
    private var titleSection: some View{
        VStack(alignment: .leading){
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }
    }
    
    private var learnMoreButton: some View{
        Button{
            
        }label:{
            Text("Learn more")
                .font(.headline)
                .frame(width: 120,height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View{
        Button{
            vm.nextLocationButtonPressed()
        }label:{
            Text("Next")
                .font(.headline)
                .frame(width: 120,height: 35)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ZStack{
        Color.cyan.ignoresSafeArea(edges: .all)
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }
   
}
