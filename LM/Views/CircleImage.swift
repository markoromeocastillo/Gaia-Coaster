
//  CircleImage.swift
//  LM
//  Created by Marko Castillo on 4/22/22.

import SwiftUI

struct CircleImage: View {
    @State var progressValue: Float = 0.0
    
    var image: Image
    
    var body: some View {
        
        ZStack{
            ProgressBar(progress: self.$progressValue)
                .frame(width: 290.0, height: 290)
                .padding(20.0).onAppear() { // Calls when it appears
                    self.progressValue = 0.30 // Data recevied from Bluetooth
                    
                }
            image
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        }
        
    }
}

struct ProgressBar: View {
    
    @Binding var progress: Float // retreived from the calculated weight of the plant
    
    var color: Color = Color.green // Color of the cir//var circleBackgroundColorColor = Color.gray
    
    var body: some View {
        
        ZStack{
            
            Circle() // First circle, Background Circle
                .stroke(lineWidth:30.0) // circle thickness
                .opacity(0.20) //20% opacity
                .foregroundColor(Color.gray) // background color
            
            Circle() // Second, circleColored Progress Bar Circle
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0))) // illustrates plants' water level
                .stroke(style: StrokeStyle(lineWidth: 25.0, lineCap: .round, lineJoin: .round)) // progress circle line thickness
                .foregroundColor(Color.cyan)
                .animation(.easeInOut(duration: 1.75))
                .rotationEffect(Angle(degrees: 270)) //Starts progress bar at 12:00
            
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
        
    }
}
