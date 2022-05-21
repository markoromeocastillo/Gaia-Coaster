//
//  BluetoothData.swift
//  LM
//
//  Created by Marko Castillo on 4/27/22.
//


import Foundation
import CoreBluetooth

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    var centralBluetooth: CBCentralManager!
    @Published var isOn = false
    @Published var coaster = [Peripheral]()
    
        override init() {
            super.init()
     
            centralBluetooth = CBCentralManager(delegate: self, queue: nil)
            centralBluetooth.delegate = self
        }


    func centralManagerDidUpdateState(_ central: CBCentralManager) {
         if central.state == .poweredOn {
             isOn = true
         }
         else {
             isOn = false
         }
    }


    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
       
        if let coasterName = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = coasterName
        }
        else {
            peripheralName = "Null"
        }
       
        let newCoaster = Peripheral(id: coaster.count, name: peripheralName, rssi: RSSI.intValue)
        print(newCoaster)
        coaster.append(newCoaster)
    }
    
    func startScanning() {
         print("start Scanning")
         centralBluetooth.scanForPeripherals(withServices: nil, options: nil)
     }
    
    func stopScanning() {
        print("stop Scanning")
        centralBluetooth.stopScan()
    }
    
}



