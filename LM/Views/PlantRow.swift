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
    @State var progressValue: Float = 0.0
    @State var waterValue: Float = 0.0
    
    var body: some View {
        HStack {
            
            ZStack{
                
                CircularProgressBar(progress: self.$waterValue)
                    .frame(width: 110.0, height: 110.0)
                    .padding(5.0).onAppear() { // Calls when it appears
                        self.waterValue = plant.waterLevel // Data recevied from Bluetooth
                        
                    }
                
                plant.image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            
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

struct CircularProgressBar: View {
    @Binding var progress: Float // retreived from the calculated weight of the plant
    
    var color: Color = Color.green // Color of the cir//var circleBackgroundColorColor = Color.gray
    
    var body: some View {
        
        ZStack{
            
            Circle() // First circle, Background Circle
                .stroke(lineWidth:5.0) // circle thickness
                .opacity(0.20) //20% opacity
                .foregroundColor(Color.gray) // background color
            
            Circle() // Second, circleColored Progress Bar Circle
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0))) // illustrates plants' water level
                .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round)) // progress circle line thickness
                .foregroundColor(Color.green)
                .animation(.easeInOut(duration: 1.5))
                .rotationEffect(Angle(degrees: 270)) //Starts progress bar at 12:00
            
        }
    }
}
