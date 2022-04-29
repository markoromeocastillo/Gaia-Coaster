//
//  LandmarkList.swift
//  LM
//
//  Created by Marko Castillo on 4/22/22.
// Description: SwiftUI View of a List of plants that links to PlantDetail

import SwiftUI



struct PlantList: View {
    var body: some View {
        
        //List is covered in a NavigationView to allow
        NavigationView {
            List(plants){ plant in
                //Sends users to
                NavigationLink{
                    PlantDetail(plant: plant)
                }   label: {
                    PlantRow(plant: plant)
                }
                
               
               
            }
            .navigationTitle("Plants")
            .toolbar {
                ToolbarItem {
                    Image (systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                }
        
        
    }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        PlantList()
            .preferredColorScheme(.dark)
    }
}
