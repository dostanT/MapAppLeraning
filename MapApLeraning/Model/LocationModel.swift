import Foundation
import MapKit

struct Location: Identifiable, Equatable{
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    //when we create many places in the same place, we create diferent id also
    // we need that in the same places was same id
    //I dont know why we normaly need this yet :)
    //Identefible
    var id: String{
        name + cityName
    }
    static func == (lhs: Location, rhs: Location) -> Bool{
        return lhs.id == rhs.id
    }
}

///This is location struct:
/*
Location(
    name: "Trevi Fountain",
    cityName: "Rome",
    coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
    description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
    imageNames: [
        "rome-trevifountain-1",
        "rome-trevifountain-2",
        "rome-trevifountain-3",
    ],
    link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
*/
