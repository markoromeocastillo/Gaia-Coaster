//
//  BluetoothView.swift
//  LM
//
//  Created by Marko Castillo on 4/28/22.
//

import SwiftUI


struct BluetoothView: View {
    var body: some View {
            VStack (spacing: 10) {

                Text("Bluetooth Devices")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                List() {
                    Text("placeholder 1")
                    Text("placeholder 2")
                }.frame(height: 300)

                Spacer()

                Text("STATUS")
                    .font(.headline)

                // Status goes here
                Text("Bluetooth status here")
                    .foregroundColor(.red)

                Spacer()

                HStack {
                    VStack (spacing: 10) {
                        Button(action: {
                            print("Start Scanning")
                        }) {
                            Text("Start Scanning")
                        }
                        Button(action: {
                            print("Stop Scanning")
                        }) {
                            Text("Stop Scanning")
                        }
                    }.padding()

                    Spacer()

                    VStack (spacing: 10) {
                        Button(action: {
                            print("Start Advertising")
                        }) {
                            Text("Start Advertising")
                        }
                        Button(action: {
                            print("Stop Advertising")
                        }) {
                            Text("Stop Advertising")
                        }
                    }.padding()
                }
                Spacer()
            }
        }
}

struct BluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothView()
            .preferredColorScheme(.dark )
    }
}
