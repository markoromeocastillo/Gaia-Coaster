//
//  PlantRow.swift
//  Gaia Caoster
//
//  Created by Marko Castillo on 4/10/22.
//  Description: Provides a preview for each item of the Plant List
//


import SwiftUI

struct PlantRow: View {
    var plant: Plant
    
    var body: some View {
        HStack {
            Spacer()
            
            plant.image
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            VStack {
                
                Text(plant.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text(plant.state)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                Text(plant.weight)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        
    }
}
//.previewLayout(.fixed(width: 300, height: 70))
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlantRow(plant: plants[0])
            PlantRow(plant: plants[1])
            PlantRow(plant: plants[2])
            
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
