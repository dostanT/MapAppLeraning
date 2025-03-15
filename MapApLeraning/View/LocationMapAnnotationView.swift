//
//  LocationMapAnnotationView.swift
//  MapApLeraning
//
//  Created by Dostan Turlybek on 13.03.2025.
//
import SwiftUI

struct LocationMapAnnotationView: View{
    
    let accentColor: Color = Color("AccentColor")
    
    var body: some View{
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(40)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(180))
                .offset(y: -3)
            //(2) что бы это исправтиь нужно добрать eще padding в низ, в данном случае примерно 40, смотря от самого обьекта
                .padding(.bottom, 40)
        }
        // (1)тут проблема в том что этого значка находится не на кончике триугольника
    }
}
#Preview {
    LocationMapAnnotationView()
    
}
