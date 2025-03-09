//
//  MapApLeraningApp.swift
//  MapApLeraning
//
//  Created by Dostan Turlybek on 09.03.2025.
//

import SwiftUI

@main
struct MapApLeraningApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
