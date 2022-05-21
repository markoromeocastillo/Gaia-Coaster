//
//  BluetoothView.swift
//  LM
//
//  Created by Marko Castillo on 4/28/22.
//

import SwiftUI


struct BluetoothView: View {
    @ObservedObject var bleManager = BLEManager()
    var body: some View {
        VStack (spacing: 10) {
            
            Text("Notfications")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .center)
            List() {
                Text("Parlor Palm ready for watering.")
                
            }.frame(height: 300)
            
            Spacer()
            
            Text("Devices")
                .font(.title3)
            
            // Status goes here
            if bleManager.isOn {
                Text("Bluetooth is on")
                    .foregroundColor(.green)
            }
            else {
                Text("Bluetooth is off")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
            
            
            List() {
                Text("Gaia Coaster - Parlor Palm ")
                Text("Gaia Coaster - Asparagus Fern")
            }.frame(height: 300)
            
            
            
            
            HStack {
                VStack (spacing: 2) {
                    Button(action: {
                        print("Start Scanning")
                    }) {
                        Text("Start Scanning")
                    }
                    Spacer()
                    Button(action: {
                        print("Stop Scanning")
                    }) {
                        Text("Stop Scanning")
                    }
                }.padding()
                
                
                VStack (spacing: 10) {
//                    Button(action: {
//                        print("Start Advertising")
//                    }) {
//                        Text("Start Advertising")
//                    }
//                    Button(action: {
//                        print("Stop Scanning")
//                    }) {
//                        Text("Stop Scanning"
//                    }
                }
            }
            Spacer()
        }
    }
}

struct BluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothView()
        
    }
}
