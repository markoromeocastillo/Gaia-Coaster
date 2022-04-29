//
//  PlantDetail.swift
//  LM
//
//  Created by Marko Castillo on 4/18/22.
// Description: Model View for a single plant. This View will show more information about the plant
// To Add: Add progress bar that reflects weight of the plant

import SwiftUI

struct PlantDetail: View {
    var plant: Plant

    var body: some View {
        ScrollView {

            CircleImage(image: plant.image)

            VStack(alignment: .leading) {
                Text(plant.name)
                    .font(.title)

                HStack {
                    Text(plant.weight)
                    Spacer()
                    Text(plant.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(plant.name)")
                    .font(.title2)
                Text(plant.description)
                
            }
            .padding()
        }
        .navigationTitle(plant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetail(plant: plants[0])
            .preferredColorScheme(.dark)
    }
}
